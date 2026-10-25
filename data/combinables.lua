--[[
    Combinables - Item combination recipes for ox_inventory

    How it works:
        When a player drags one item onto a DIFFERENT item inside their own inventory,
        this file is checked for a matching recipe. If a recipe is found, the
        combination fires instead of the normal swap operation.

    Recipe fields:
        items   (required) Table of exactly two item names. Order does NOT matter.
                            { 'item_a', 'item_b' }

        counts  (optional) Required count of each item that will be consumed.
                            Defaults to { 1, 1 } if omitted.
                            { 2, 3 }  -- consumes 2 of item_a and 3 of item_b

        result  (optional) List of items to add to the inventory on success.
                            Each entry: { name = 'item_name', count = 1, metadata = {} }
                            Omit entirely if the recipe has no item output (action-only).

        label   (optional) Text shown in the success notification.
                            Defaults to "ItemA + ItemB combined!" if omitted.

        duration      (optional) Duration in ms of a client-side progress bar shown
                            BEFORE items are consumed. If the player cancels or moves,
                            the combine is aborted and nothing is taken.
                            Example: duration = 3000

        progressLabel (optional) Text shown inside the progress bar.
                            Defaults to the recipe label if omitted.

        animation     (optional) Animation played during the progress bar.
                            { dict = 'animDict', clip = 'animClip' }

        action        (optional) Server-side function called after items are consumed and
                            result items are added. Use this for custom effects such as
                            triggering events, applying buffs, logging, etc.
                            Signature: function(source, playerInventory) end

    Notes:
        - All validation (counts, weight, item existence) runs on the server.
          Clients cannot spoof or bypass it.
        - Duplicate recipes for the same pair of items will be ignored and a warning
          will be printed to the server console.
        - If a result item name doesn't exist in items.lua, the recipe will fail
          safely with a console warning (no crash, no item loss).
]]

return {

    {
        items         = { 'empty_weed_bag', 'weed_purple_haze' },
        counts        = { 1, 1 },
        label         = 'Has embolsado Amnesia Weed',
        duration      = 10000,
        animation     = { dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', clip = 'weed_crouch_checkingleaves_idle_02_inspector' },
        progressLabel = 'Embolsando marihuana...',
        result = {
            { name = 'weed_amnesia', count = 1 },
        },
    },
    {
        items         = { 'empty_weed_bag', 'weed_og' },
        counts        = { 1, 1 },
        label         = 'Has embolsado OG Weed',
        duration      = 10000,
        animation     = { dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', clip = 'weed_crouch_checkingleaves_idle_02_inspector' },
        progressLabel = 'Embolsando marihuana...',
        result = {
            { name = 'weed_og-kush', count = 1 },
        },
    },
    {
        items         = { 'empty_weed_bag', 'weed_white_widow' },
        counts        = { 1, 1 },
        label         = 'Has embolsado White Widow Weed',
        duration      = 10000,
        animation     = { dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', clip = 'weed_crouch_checkingleaves_idle_02_inspector' },
        progressLabel = 'Embolsando marihuana...',
        result = {
            { name = 'weed_white-widow', count = 1 },
        },
    },
    {
        items         = { 'empty_weed_bag', 'weed_blueberry' },
        counts        = { 1, 1 },
        label         = 'Has embolsado Blueberry Weed',
        duration      = 10000,
        animation     = { dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', clip = 'weed_crouch_checkingleaves_idle_02_inspector' },
        progressLabel = 'Embolsando marihuana...',
        result = {
            { name = 'weed_skunk', count = 1 },
        },
    },
    {
        items         = { 'meat3', 'taco_shell' },
        counts        = { 1, 1 },
        label         = 'Taco preparado',
        duration      = 15000,
        animation     = { dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', clip = 'weed_crouch_checkingleaves_idle_02_inspector' },
        progressLabel = 'Preparando taco...',
        result = {
            { name = 'taco_beef', count = 1 },
        },
    },

    --- Template: combine with a custom server action
    --   items  = { 'item_a', 'item_b' },
    --   counts = { 1, 1 },
    --   label  = 'Combined!',
    --   result = {
    --       { name = 'result_item', count = 1 },
    --   },
    --   action = function(source, playerInventory)
    --       -- TriggerClientEvent('myResource:onCombined', source)
    --   end,

}
