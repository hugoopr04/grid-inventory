-- Per-player "has this slot been searched yet" state for inventories that must
-- be frisked before their contents can be taken (other players, dumpsters).
--
-- State is kept in memory only. It used to be written to server KVP with one
-- key per (player, inventory) pair and never pruned, which grew without bound
-- for every body frisked and every dumpster opened on the server.

---@type table<string, { slots: table<string, { name: string }>, time: number }>
local searchedInventories = {}

-- Drop cached entries that have not been touched for a while, so long uptimes
-- don't accumulate state for inventories nobody will reopen.
local CACHE_TTL = 30 * 60 -- seconds

--- Get Inventory module (lazy to avoid circular dependency)
---@return function
local function getInventory()
    return require 'modules.inventory.server'
end

--- Get player identifier
---@param source number
---@return string?
local function getIdentifier(source)
    local Inventory = getInventory()
    local inv = Inventory(source)
    if not inv then return end
    return inv.owner
end

---@param invType string
---@return boolean
local function shouldRequireSearch(invType)
    -- Require searching when inspecting/frisking another player or looting a dumpster
    return invType == 'player' or invType == 'dumpster'
end

---@param identifier string
---@param inventoryId string|number
---@return string
local function getCacheKey(identifier, inventoryId)
    return ('%s\0%s'):format(identifier, inventoryId)
end

---@param identifier string
---@param inventoryId string|number
---@return table<string, { name: string }>
local function getEntry(identifier, inventoryId)
    local key = getCacheKey(identifier, inventoryId)
    local entry = searchedInventories[key]

    if not entry then
        entry = { slots = {}, time = os.time() }
        searchedInventories[key] = entry
    else
        entry.time = os.time()
    end

    return entry.slots
end

--- Get searched state for a player opening an inventory
---@param source number
---@param invType string
---@param inventory table
---@return table?
local function GetSearchState(source, invType, inventory)
    if not shouldRequireSearch(invType) then return nil end

    local identifier = getIdentifier(source)
    if not identifier then return nil end

    local state = getEntry(identifier, inventory.id)

    -- Invalidate slots whose contents changed since they were searched.
    for slotStr, fingerprint in pairs(state) do
        local slot = tonumber(slotStr)
        local item = slot and inventory.items[slot]

        if not item or type(fingerprint) ~= 'table' or item.name ~= fingerprint.name then
            state[slotStr] = nil
        end
    end

    return state
end

--- Mark a slot as searched
lib.callback.register('ox_inventory:searchSlot', function(source, data)
    local Inventory = getInventory()

    local identifier = getIdentifier(source)
    if not identifier then return false end

    local inv = Inventory(source)
    if not inv then return false end

    local openInv = inv.open
    if not openInv then return false end

    local right = Inventory(openInv)
    if not right then return false end

    -- Validate this inventory requires searching
    if not shouldRequireSearch(right.type) then return false end

    local slot = data and data.slot
    if type(slot) ~= 'number' or slot % 1 ~= 0 or slot < 1 or slot > right.slots then return false end

    -- Check that the slot actually has an item
    local item = right.items[slot]
    if not item then return false end

    -- The progress bar runs on the client, so enforce the minimum search time
    -- here as well. Without this a modified client could reveal every slot at
    -- once by firing this callback in a loop.
    local duration = GetConvarInt('inventory:searchduration', 2000)

    if duration > 0 then
        local now = GetGameTimer()
        local allowedAt = inv.nextSearch or 0

        if now < allowedAt then return false end

        -- Allow a small margin for network latency.
        inv.nextSearch = now + math.floor(duration * 0.9)
    end

    getEntry(identifier, right.id)[tostring(slot)] = { name = item.name }

    return true
end)

--- Clean up cached data when a player disconnects
AddEventHandler('playerDropped', function()
    local identifier = getIdentifier(source)
    if not identifier then return end

    local prefix = identifier .. '\0'

    for key in pairs(searchedInventories) do
        if key:sub(1, #prefix) == prefix then
            searchedInventories[key] = nil
        end
    end
end)

--- Periodically drop stale entries
CreateThread(function()
    while true do
        Wait(5 * 60 * 1000)

        local expiry = os.time() - CACHE_TTL

        for key, entry in pairs(searchedInventories) do
            if entry.time < expiry then
                searchedInventories[key] = nil
            end
        end
    end
end)

return {
    GetSearchState = GetSearchState,
    shouldRequireSearch = shouldRequireSearch,
}
