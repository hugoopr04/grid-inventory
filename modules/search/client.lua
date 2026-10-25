--- NUI callback: player finished searching a slot (progress bar completed)
RegisterNUICallback('searchSlot', function(data, cb)
    if not LocalPlayer.state.invOpen then return cb(false) end

    local slot = data.slot
    if type(slot) ~= 'number' then return cb(false) end

    local success = lib.callback.await('ox_inventory:searchSlot', false, { slot = slot })
    cb(success or false)
end)

return {}
