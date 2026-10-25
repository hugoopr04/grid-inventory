# Changes from upstream ox_inventory

**Grid Inventory by prietodev** — modifications copyright © 2026 prietodev.

Based on [ox_inventory](https://github.com/overextended/ox_inventory) **2.45.1**,
original work copyright © 2024 Overextended, licensed under GNU GPL-3.0.

This file is the record of modifications required by GPL-3.0 section 5(a).
Everything listed here is a change made on top of upstream 2.45.1; everything not
listed is upstream code.

---

## Features added

### Grid inventory layout
Items occupy a rectangular area on a grid instead of a single square slot.

- `sizeX` / `sizeY` per item in `data/items.lua` and `data/weapons.lua`, with
  sensible defaults applied by category in `modules/items/shared.lua`.
- Grid dimensions configurable via the `inventory:gridWidth` and
  `inventory:gridHeight` convars (default 7 × 8).
- Grid position (`gridX`, `gridY`, `rotated`) is stored per slot, persisted to the
  database and synchronised to every viewer.
- Item rotation while dragging (`R`).
- Server-side placement validation: bounds and overlap are checked on every move,
  purchase and craft. Positions sent by the client are never trusted.
- Items saved before the grid existed, or saved with different grid dimensions, are
  auto-placed on load instead of stacking at (0, 0).
- New UI components: `TarkovGridItem.tsx`, `helpers/grid.ts`, `helpers/dragState.ts`,
  rewritten `InventoryGrid.tsx`. Replaces upstream's `InventorySlot.tsx`.

### Item combining
Drag one item onto a different item inside your own inventory to combine them.

- Recipes in `data/combinables.lua`: two ingredients, optional counts, optional
  result items, optional progress bar with animation, optional server-side action.
- All validation is server-side (counts, weight, item existence, re-validation after
  the progress bar). Duplicate and malformed recipes are reported at startup.
- Implemented in `modules/inventory/server.lua` (`tryCombineItems`).

### Search before loot
Another player's inventory and dumpsters must be searched slot by slot before their
contents can be taken.

- New module `modules/search/`.
- Per-player, per-inventory state kept in memory with TTL-based pruning.
- Minimum search time enforced on the server as well as the client, so the gate
  cannot be skipped by a modified client. Duration set by `inventory:searchduration`.
- Searched state is invalidated when the contents of a slot change.

### Persistent hotbar
Hotkeys 1–5 are bound to specific items rather than to slot numbers.

- Assignments are stored in the player's KVP, so they survive a relog and a restart.
- Items are tracked by unique metadata (`serial` / `id`) where available, falling
  back to name, so an assignment follows the item when it changes slot.
- Implemented in `client.lua`, with `helpers/hotbar.ts` and the `assignHotkey` NUI
  callback.

### Job-based holster animations
Police draw and holster with a duty animation; everyone else gets a generic draw.
Item-specific `anim` overrides still take priority. Melee keeps its own unholster.
A cooldown prevents weapon-switch spam during the holster transition.
Implemented in `modules/weapon/client.lua`.

### Optional roleplay emote on give
`inventory:giveemote` convar. Empty by default. When set to a command template it is
executed after a successful hand-over, receiving the amount and the item label.

---

## Behaviour changes from upstream

- **Keyboard input is not passed to the game while the inventory is open**
  (`SetNuiFocusKeepInput(false)`), so keybinds from other resources do not fire
  while dragging items. The side effect is that the player cannot move with the
  inventory open.
- **Notifications are anchored to the bottom** of the screen.
- **The upstream update check is off by default.** This fork's version no longer
  tracks upstream releases, so the notice would point users at a different resource.
  Re-enable with `setr inventory:versioncheck true`.
- **Richer swap failures:** failed moves return the affected slots so the UI can
  resync, instead of only an error string.
- **Dumpster loot table expanded** with drop chances, and more item types.
- **`data/shops.lua`** ships the upstream default shops with `cola` swapped for
  `sprunk`, which exists in this item set.
- **`data/crafting.lua` is empty** — upstream's entry was a debug bench.

## Robustness changes

- **Missing optional integrations fail safely.** `useExport` in
  `modules/items/shared.lua` checks whether the target resource is started, warns
  once, and returns instead of throwing. Errors inside an export are caught too.
- **Startup report** listing every item whose integration resource is not installed,
  grouped by resource, so a fresh install gets one readable summary instead of
  errors appearing later during play.
- **`Inventory.CanCarryAmount` guards against zero-weight items** instead of
  dividing by zero.
- **`updateWeapon` guards** `weapon.metadata.ammo` before comparing, and checks the
  value type on the `melee` branch.
- **`TriggerEventHooks` guards** against a nil inventory id.
- **Weapon mismatch correction waits for the holster animation** to finish before
  correcting or disarming, so third-party holster scripts are not fought.
- **`ox_inventory:useItem` has a 10 second callback timeout** instead of waiting
  forever, so an unresponsive server cannot leave a client unable to use items.

## Content

- `data/items.lua` replaced with a 359-item set.
- `data/weapons.lua` extended with add-on weapons and magazines; the vanilla
  `WEAPON_BATTLERIFLE` and `WEAPON_SNOWLAUNCHER` entries were removed.
- `web/images` extended to 720 icons.
- `extras/items2.lua`: an additional reference pack of 583 items, not loaded.
- Spanish locale completed; `ui_rotate`, `ui_size`, `combine_not_enough`,
  `combine_cannot_carry` and `weapon_switch_cooldown` keys added to `en.json`.

---

## Licence

This program is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software Foundation,
either version 3 of the License, or (at your option) any later version.

Both the original work and these modifications are distributed under that licence.
See [`LICENSE`](LICENSE) for the full text and [`README.md`](README.md) for the
attribution notice.
