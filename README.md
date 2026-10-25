# Grid Inventory — by prietodev

Slot-based inventory for FiveM with a grid (Tarkov-style) UI layer, item rotation,
item combining, a persistent hotbar, and a search-before-loot mechanic.

A redesign of [ox_inventory](https://github.com/overextended/ox_inventory) by
Overextended. Modifications © 2026 **prietodev**; see [`CHANGES.md`](CHANGES.md)
for the full list of what was changed.

Distributed under the **GNU GPL-3.0** — see [Licence](#licence) at the bottom.

> ### ⚠️ Rename the folder to `ox_inventory`
> Cloning this repository gives you a folder called `grid-inventory`. The resource
> **must** be installed as `ox_inventory`: the interface loads every item icon from
> `nui://ox_inventory/web/images`, and other resources call `exports.ox_inventory`.
> Rename it before you start the server, or every icon will be blank.

> 🇪🇸 **La versión en español está más abajo**, en [Guía en español](#guía-en-español).

---

## Requirements

Install these **before** starting the inventory.

| Requirement | Minimum version | Notes |
| --- | --- | --- |
| FXServer artifacts | build **6116** or newer | |
| OneSync | enabled | `set onesync on` |
| [ox_lib](https://github.com/overextended/ox_lib) | **3.27.0** | Must start before ox_inventory |
| [oxmysql](https://github.com/overextended/oxmysql) | **2.7.3** | Must start before ox_inventory |
| A framework | — | `ox_core`, `esx` (ESX Legacy), `qbx_core` or `nd_core` |
| MySQL / MariaDB | — | Tables are created automatically |

**Optional:** [ox_target](https://github.com/overextended/ox_target) — only needed if you
set `inventory:target 1`. It must start **before** ox_inventory.

---

## Download

**[Download the latest release](https://github.com/hugoopr04/grid-inventory/releases/latest)**

The release archive already contains a folder named `ox_inventory`, so you can extract
it straight into your resources folder with nothing to rename. Cloning the repository
instead gives you a `grid-inventory` folder that you must rename yourself.

---

## Installation

### 1. Drop the folder in

Put `ox_inventory` in your resources folder. If you use the `[ox]` convention:

```
resources/[ox]/ox_inventory
```

Do **not** rename the folder. The UI loads images from `nui://ox_inventory/web/images`,
so a different folder name breaks every item icon.

### 2. Set the start order

In `server.cfg`, these must start in this order:

```cfg
ensure oxmysql
ensure ox_lib
ensure ox_target          # only if you use inventory:target 1
ensure ox_inventory
```

If your framework starts the inventory itself, make sure `ox_lib` and `oxmysql`
are still loaded first.

### 3. Tell it which framework you use

```cfg
setr inventory:framework "esx"
```

Valid values: `ox`, `esx`, `qbx`, `nd`. **Default is `esx`.**

### 4. Start the server once

On first start the resource creates everything it needs in the database:

- Creates the `ox_inventory` table (stashes).
- Adds `trunk` and `glovebox` columns to your vehicles table.
- Adds an `inventory` column to your users table.

The table names depend on your framework:

| Framework | Players table | Vehicles table |
| --- | --- | --- |
| `esx` | `users` (`identifier`) | `owned_vehicles` (`plate`) |
| `ox` | `character_inventory` (`charid`) | `vehicles` (`id`) |
| `qbx` | `players` (`citizenid`) | `player_vehicles` (`id`) |
| `nd` | `nd_characters` (`charid`) | `nd_vehicles` (`id`) |

No `.sql` file to import. Just make sure your DB user has `ALTER TABLE` permission
the first time you start it.

### 5. Remove any old inventory

Delete or stop whatever inventory you had before (`esx_inventoryhud`, `qb-inventory`,
etc.). Running two inventories at once **will** corrupt player data.

Migrating from another inventory? `setup/convert.lua` has helpers for ESX and QB —
read it before using it, and **back up your database first**.

That's it. Join the server and press `TAB`.

---

## Configuration

Everything is configured with **convars** in `server.cfg`. There is no `config.lua`
and **you should not edit the Lua files** to change settings — your changes would be
lost on the next update.

Use `setr` so the client receives the value too.

### The basics

```cfg
setr inventory:framework "esx"      # ox | esx | qbx | nd
setr inventory:slots 50             # slots per player
setr inventory:weight 30000         # max weight in grams (30000 = 30 kg)
setr inventory:gridWidth 7          # grid columns
setr inventory:gridHeight 8         # grid rows
setr inventory:police ["police", "sheriff"]   # jobs that can search players
setr inventory:target 0             # 1 = use ox_target instead of markers
```

> `gridWidth × gridHeight` should be at least `slots`. If it isn't, the grid grows
> downwards automatically so every slot stays reachable.

### Keys and UI

```cfg
setr inventory:keys ["F2", "K", "TAB"]   # keys that open the inventory
setr inventory:screenblur 1              # blur the screen while open
setr inventory:itemnotify 1              # notify on item add/remove
setr inventory:weaponnotify 1
setr inventory:giveplayerlist 0          # 1 = pick the target from a list
setr inventory:searchduration 2000       # ms to search one slot (players/dumpsters)
```

### Weapons

```cfg
setr inventory:weaponanims 1        # draw/holster animations
setr inventory:autoreload 0
setr inventory:aimedfiring 0
setr inventory:weaponmismatch 1     # disarm players holding a weapon they don't own
setr inventory:disableweapons 0
setr inventory:ignoreweapons []     # weapons the mismatch check should skip
```

### Loot, drops and stashes

```cfg
setr inventory:randomloot 1         # random loot in dumpsters and unowned vehicles
setr inventory:networkdumpsters 0   # 1 = dumpsters shared between players
setr inventory:dropprops 0          # 1 = spawn a prop for dropped items
setr inventory:dropmodel "prop_med_bag_01b"
setr inventory:dropslots 50
setr inventory:dropweight 30000
set inventory:clearstashes "6 MONTH"   # delete stashes untouched for this long ("" = never)
```

### Logging

```cfg
set inventory:loglevel 1            # 0 = off, 1 = important, 2 = everything
set inventory:webhook ""            # Discord webhook for logs
```

### Optional extras

```cfg
set inventory:versioncheck "false"  # off by default; true checks upstream ox_inventory
setr inventory:giveemote ""         # roleplay emote when giving an item (see below)
setr inventory:accounts ["money"]   # items treated as currency
```

**`inventory:giveemote`** is off by default. Set it to a command template and it runs
after a successful hand-over. It takes the amount and the item label, in that order:

```cfg
setr inventory:giveemote "me hands over %dx %s"
```

Only set this if your server actually has that command (`/me`, `/ame`, …). Leave it
empty and nothing is executed.

---

## Adding and editing items

Items live in `data/items.lua`:

```lua
['water'] = {
    label = 'Water',
    weight = 500,
    sizeX = 1,          -- grid width
    sizeY = 2,          -- grid height
    stack = true,
    close = true,
    client = {
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 2500,
        notification = 'You drank some water'
    }
},
```

**Each item needs an icon** at `web/images/<item name>.png`, or an explicit
`client = { image = 'something.png' }`. Names are **case-sensitive on Linux servers** —
`Water.png` will not be found for an item called `water`.

Other data files:

| File | What it holds |
| --- | --- |
| `data/items.lua` | Items (359 included) |
| `data/weapons.lua` | Weapons, ammo, components, tints |
| `data/shops.lua` | Shops (8 included) |
| `data/stashes.lua` | Fixed stashes |
| `data/crafting.lua` | Crafting benches (empty by default) |
| `data/combinables.lua` | Drag-one-item-onto-another recipes |
| `data/licenses.lua` | Buyable licences |
| `data/evidence.lua` | Police evidence lockers |
| `data/vehicles.lua` | Trunk/glovebox capacity per vehicle class |
| `data/animations.lua` | Reusable animations and props |

`extras/items2.lua` is an **extra item pack that is not loaded**. It is a reference
list of 583 more items you can copy from. Leaving it in `extras/` keeps it out of the
client download — do not move it into `data/`.

---

## Optional integrations

Some of the bundled items call exports in other resources — jobs, phones, drug scripts
and similar. **Those resources are not included and are not required.** If one is
missing, that single item simply does nothing when used, and the server prints one
warning on startup telling you exactly which ones are absent:

```
[ox_inventory] 10 optional integration(s) are not installed, so the items using them
will do nothing when used: fire_system (1 item), p_policejob (8 items), ...
```

The resources referenced are: `p_policejob`, `p_itemclothes`, `p_phone`, `sa_utils`,
`nr_ilegalphone`, `nr-shisha`, `it-drugs`, `origen_police`, `ND_Police`, `ND_Core`,
`fire_system`, `weazelnews_mailbox`, `rahe-boosting`, `rahe-racing`, `RAGE_CarLock`
and `cartas_pokemon`.

You have three options for each: install your own equivalent and point the item at it,
rewrite the item to use your script, or delete the item from `data/items.lua`.
**Nothing breaks if you ignore them.**

Some weapons in `data/weapons.lua` are add-on weapons (`WEAPON_GLOCK20`,
`WEAPON_PEPPERSPRAY`, `WEAPON_ANTIDOTE`, the `WEAPON_G19X*` family and others). They
need the matching weapon stream installed on your server. Without it the item exists
but cannot be equipped — remove those entries if you don't use add-on weapons.

---

## Controls

| Key | Action |
| --- | --- |
| `TAB` / `F2` / `K` | Open the inventory |
| `R` while dragging | Rotate the item |
| Right click | Item context menu |
| `ALT` + left click | Quick use |
| `CTRL` + left click | Move the stack to the other inventory |
| `SHIFT` + drag | Split the stack in half |
| `CTRL` + `SHIFT` + left click | Move half the stack across |
| `1` – `5` | Hotbar |

The hotbar is persistent: assignments survive a relog and a server restart, and follow
the item even if it changes slot.

Note that the player **cannot move while the inventory is open** — this is intentional,
so keybinds from other resources (crouch on `LCTRL`, for example) don't fire while you
are dragging items.

---

## Rebuilding the UI

A ready-to-use build is already in `web/build`, so **you do not need to build anything**
to use this resource. Only do this if you want to modify the interface.

```bash
cd web
npm install
npm run build
```

Requires Node.js 18 or newer. The output goes to `web/build`, which is what the resource
actually serves. The included `web/node_modules` folder, if present, can be deleted —
`npm install` recreates it.

---

## Troubleshooting

**"ox_inventory requires the ox_lib resource"**
`ox_lib` is missing or starts after the inventory. Fix the order in `server.cfg`.

**"UI has not been built"**
`web/build/index.html` is missing. You deleted it, or an antivirus/unzip step dropped it.
Re-extract the resource, or run the build above.

**All item icons are blank**
The folder was renamed. It must be exactly `ox_inventory`. If you really need another
name, set `inventory:imagepath` to match.

**One icon is blank, on a Linux server**
Filename case. `web/images/Water.png` does not match an item called `water`.
Rename the file to lowercase.

**Items don't save / stashes are empty after a restart**
`oxmysql` isn't connected, or the DB user couldn't run `ALTER TABLE` on first start.
Check the console at startup for SQL errors.

**Weight is ignored / players carry everything**
Check that `inventory:weight` is set with `setr` (not `set`) and that no other resource
calls `SetMaxWeight` with a huge value.

**"attempted to restrict slot … but … has no job restriction"**
A shop slot in `data/shops.lua` has a `grade` but the shop has no `groups`. Add `groups`
to the shop or remove the `grade`.

**An item does nothing when used**
Check the startup warning about optional integrations. The resource that item needs is
probably not installed.

---

## Licence

**Grid Inventory** is a modified version of
[**ox_inventory**](https://github.com/overextended/ox_inventory) by **Overextended**,
licensed under the **GNU General Public License v3.0**.

- Original work copyright © 2024 Overextended <https://github.com/overextended>
- Modifications copyright © 2026 prietodev

The modifications are listed in [`CHANGES.md`](CHANGES.md). Both the original work and
the modifications are distributed under the GPL-3.0.

This program is free software: you can redistribute it and/or modify it under the terms
of the GNU General Public License as published by the Free Software Foundation, either
version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.
If not, see <https://www.gnu.org/licenses/>.

**What this means for you as a user:** you receive the complete source code (it is all
here — nothing is encrypted or obfuscated), you may modify it freely, and you may
redistribute it, provided you keep it under the GPL-3.0 and keep these notices.

The full licence text is in [`LICENSE`](LICENSE).

Item icons: many were provided by [yaroph](https://forum.cfx.re/u/yaroph/) for free use
with ox_inventory — see `web/images/readme.md`.

Upstream documentation (most of it applies to this version too):
<https://overextended.dev/ox_inventory>

---
---

# Guía en español

**Grid Inventory — por prietodev**

Inventario por casillas para FiveM con interfaz de rejilla (estilo Tarkov), rotación de
objetos, combinación de objetos, barra rápida persistente y mecánica de registro antes
de poder saquear.

Un rediseño de [ox_inventory](https://github.com/overextended/ox_inventory) de
Overextended. Modificaciones © 2026 **prietodev**; en [`CHANGES.md`](CHANGES.md) tienes
la lista completa de cambios.

Distribuido bajo **GNU GPL-3.0** — ver [Licencia](#licencia) al final.

> ### ⚠️ Renombra la carpeta a `ox_inventory`
> Al clonar este repositorio obtienes una carpeta llamada `grid-inventory`. El recurso
> **tiene** que instalarse como `ox_inventory`: la interfaz carga los iconos desde
> `nui://ox_inventory/web/images` y otros recursos llaman a `exports.ox_inventory`.
> Renómbrala antes de arrancar el servidor o todos los iconos saldrán en blanco.

## Requisitos

Instala esto **antes** de arrancar el inventario.

| Requisito | Versión mínima | Notas |
| --- | --- | --- |
| Artifacts de FXServer | build **6116** o superior | |
| OneSync | activado | `set onesync on` |
| [ox_lib](https://github.com/overextended/ox_lib) | **3.27.0** | Debe arrancar antes |
| [oxmysql](https://github.com/overextended/oxmysql) | **2.7.3** | Debe arrancar antes |
| Un framework | — | `ox_core`, `esx` (ESX Legacy), `qbx_core` o `nd_core` |
| MySQL / MariaDB | — | Las tablas se crean solas |

**Opcional:** [ox_target](https://github.com/overextended/ox_target) — solo si pones
`inventory:target 1`. Debe arrancar **antes** que ox_inventory.

## Descarga

**[Descargar la última versión](https://github.com/hugoopr04/grid-inventory/releases/latest)**

El ZIP de la release ya contiene una carpeta llamada `ox_inventory`, así que lo extraes
directamente en tu carpeta de recursos sin renombrar nada. Si clonas el repositorio en
su lugar, obtienes una carpeta `grid-inventory` que tendrás que renombrar tú.

---

## Instalación

### 1. Copia la carpeta

Pon `ox_inventory` en tu carpeta de recursos. Si usas la convención `[ox]`:

```
resources/[ox]/ox_inventory
```

**No cambies el nombre de la carpeta.** La interfaz carga las imágenes desde
`nui://ox_inventory/web/images`, así que otro nombre deja todos los iconos en blanco.

### 2. Orden de arranque

En `server.cfg`, en este orden:

```cfg
ensure oxmysql
ensure ox_lib
ensure ox_target          # solo si usas inventory:target 1
ensure ox_inventory
```

### 3. Indica tu framework

```cfg
setr inventory:framework "esx"
```

Valores válidos: `ox`, `esx`, `qbx`, `nd`. **Por defecto `esx`.**

### 4. Arranca el servidor una vez

En el primer arranque crea en la base de datos todo lo que necesita:

- La tabla `ox_inventory` (alijos).
- Las columnas `trunk` y `glovebox` en tu tabla de vehículos.
- La columna `inventory` en tu tabla de usuarios.

Las tablas dependen del framework:

| Framework | Tabla de jugadores | Tabla de vehículos |
| --- | --- | --- |
| `esx` | `users` (`identifier`) | `owned_vehicles` (`plate`) |
| `ox` | `character_inventory` (`charid`) | `vehicles` (`id`) |
| `qbx` | `players` (`citizenid`) | `player_vehicles` (`id`) |
| `nd` | `nd_characters` (`charid`) | `nd_vehicles` (`id`) |

No hay ningún `.sql` que importar. Solo asegúrate de que el usuario de la base de datos
tenga permiso `ALTER TABLE` la primera vez.

### 5. Quita el inventario anterior

Borra o detén el inventario que tuvieras (`esx_inventoryhud`, `qb-inventory`, etc.).
Tener dos inventarios a la vez **corrompe** los datos de los jugadores.

¿Vienes de otro inventario? `setup/convert.lua` incluye utilidades para ESX y QB —
léelo antes de usarlo y **haz copia de seguridad de la base de datos primero**.

Ya está. Entra al servidor y pulsa `TAB`.

## Configuración

Todo se configura con **convars** en `server.cfg`. No hay `config.lua` y **no debes
editar los ficheros Lua** para cambiar ajustes: perderías los cambios en la siguiente
actualización.

Usa `setr` para que el cliente también reciba el valor.

### Lo básico

```cfg
setr inventory:framework "esx"      # ox | esx | qbx | nd
setr inventory:slots 50             # casillas por jugador
setr inventory:weight 30000         # peso máximo en gramos (30000 = 30 kg)
setr inventory:gridWidth 7          # columnas de la rejilla
setr inventory:gridHeight 8         # filas de la rejilla
setr inventory:police ["police", "sheriff"]   # trabajos que pueden registrar
setr inventory:target 0             # 1 = usar ox_target en vez de marcadores
```

> `gridWidth × gridHeight` debería ser al menos `slots`. Si no lo es, la rejilla crece
> hacia abajo automáticamente para que todas las casillas sigan siendo accesibles.

### Teclas e interfaz

```cfg
setr inventory:keys ["F2", "K", "TAB"]   # teclas que abren el inventario
setr inventory:screenblur 1              # difuminar la pantalla
setr inventory:itemnotify 1              # avisar al añadir/quitar objetos
setr inventory:weaponnotify 1
setr inventory:giveplayerlist 0          # 1 = elegir destinatario de una lista
setr inventory:searchduration 2000       # ms para registrar una casilla
```

### Armas

```cfg
setr inventory:weaponanims 1        # animaciones de desenfundar/enfundar
setr inventory:autoreload 0
setr inventory:aimedfiring 0
setr inventory:weaponmismatch 1     # desarmar a quien lleve un arma que no tiene
setr inventory:disableweapons 0
setr inventory:ignoreweapons []
```

### Botín, tiradas y alijos

```cfg
setr inventory:randomloot 1         # botín aleatorio en contenedores y coches sin dueño
setr inventory:networkdumpsters 0   # 1 = contenedores compartidos entre jugadores
setr inventory:dropprops 0          # 1 = crear un prop al tirar objetos
setr inventory:dropmodel "prop_med_bag_01b"
setr inventory:dropslots 50
setr inventory:dropweight 30000
set inventory:clearstashes "6 MONTH"   # borrar alijos sin tocar este tiempo ("" = nunca)
```

### Registro de eventos

```cfg
set inventory:loglevel 1            # 0 = nada, 1 = importante, 2 = todo
set inventory:webhook ""            # webhook de Discord
```

### Extras opcionales

```cfg
set inventory:versioncheck "false"  # desactivado por defecto; true comprueba el ox_inventory original
setr inventory:giveemote ""         # emote de rol al dar un objeto (ver abajo)
setr inventory:accounts ["money"]   # objetos que cuentan como dinero
```

**`inventory:giveemote`** está desactivado por defecto. Si le pones una plantilla de
comando, se ejecuta tras entregar un objeto correctamente. Recibe la cantidad y la
etiqueta del objeto, en ese orden:

```cfg
setr inventory:giveemote "ame le da %dx %s"
```

Ponlo solo si tu servidor tiene de verdad ese comando (`/me`, `/ame`, …). Si lo dejas
vacío no se ejecuta nada.

## Añadir y editar objetos

Los objetos están en `data/items.lua`:

```lua
['water'] = {
    label = 'Agua',
    weight = 500,
    sizeX = 1,          -- ancho en la rejilla
    sizeY = 2,          -- alto en la rejilla
    stack = true,
    close = true,
    client = {
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 2500,
        notification = 'Has bebido agua'
    }
},
```

**Cada objeto necesita su icono** en `web/images/<nombre del objeto>.png`, o un
`client = { image = 'algo.png' }` explícito. Los nombres **distinguen mayúsculas en
servidores Linux**: `Water.png` no se encontrará para un objeto llamado `water`.

| Fichero | Contenido |
| --- | --- |
| `data/items.lua` | Objetos (359 incluidos) |
| `data/weapons.lua` | Armas, munición, componentes, tintes |
| `data/shops.lua` | Tiendas (8 incluidas) |
| `data/stashes.lua` | Alijos fijos |
| `data/crafting.lua` | Mesas de crafteo (vacío por defecto) |
| `data/combinables.lua` | Recetas de arrastrar un objeto sobre otro |
| `data/licenses.lua` | Licencias comprables |
| `data/evidence.lua` | Taquillas de pruebas policiales |
| `data/vehicles.lua` | Capacidad de maletero/guantera por clase |
| `data/animations.lua` | Animaciones y props reutilizables |

`extras/items2.lua` es un **pack extra de objetos que no se carga**. Es una lista de
referencia con 583 objetos más para copiar de ahí. Dejarlo en `extras/` evita que se
descargue a los clientes — no lo muevas a `data/`.

## Integraciones opcionales

Algunos objetos incluidos llaman a exports de otros recursos (trabajos, teléfonos,
scripts de drogas…). **Esos recursos no van incluidos y no son obligatorios.** Si falta
uno, ese objeto concreto simplemente no hace nada al usarlo, y el servidor imprime un
aviso al arrancar diciéndote exactamente cuáles faltan:

```
[ox_inventory] 10 optional integration(s) are not installed, so the items using them
will do nothing when used: fire_system (1 item), p_policejob (8 items), ...
```

Los recursos referenciados son: `p_policejob`, `p_itemclothes`, `p_phone`, `sa_utils`,
`nr_ilegalphone`, `nr-shisha`, `it-drugs`, `origen_police`, `ND_Police`, `ND_Core`,
`fire_system`, `weazelnews_mailbox`, `rahe-boosting`, `rahe-racing`, `RAGE_CarLock` y
`cartas_pokemon`.

Con cada uno tienes tres opciones: instalar tu equivalente y apuntar el objeto a él,
reescribir el objeto para usar tu script, o borrar el objeto de `data/items.lua`.
**Si no haces nada, no se rompe nada.**

Algunas armas de `data/weapons.lua` son armas addon (`WEAPON_GLOCK20`,
`WEAPON_PEPPERSPRAY`, `WEAPON_ANTIDOTE`, la familia `WEAPON_G19X*` y otras). Necesitan
el stream del arma instalado en tu servidor. Sin él el objeto existe pero no se puede
equipar — bórralas si no usas armas addon.

## Controles

| Tecla | Acción |
| --- | --- |
| `TAB` / `F2` / `K` | Abrir el inventario |
| `R` mientras arrastras | Rotar el objeto |
| Clic derecho | Menú contextual del objeto |
| `ALT` + clic izquierdo | Uso rápido |
| `CTRL` + clic izquierdo | Mover la pila al otro inventario |
| `SHIFT` + arrastrar | Partir la pila por la mitad |
| `CTRL` + `SHIFT` + clic izquierdo | Mover media pila al otro inventario |
| `1` – `5` | Barra rápida |

La barra rápida es persistente: las asignaciones sobreviven a reconexiones y reinicios,
y siguen al objeto aunque cambie de casilla.

Ten en cuenta que el jugador **no puede moverse con el inventario abierto**. Es
intencionado, para que las teclas de otros recursos (agacharse con `LCTRL`, por ejemplo)
no se disparen mientras arrastras objetos.

## Recompilar la interfaz

La interfaz ya viene compilada en `web/build`, así que **no necesitas compilar nada**
para usar el recurso. Hazlo solo si quieres modificarla.

```bash
cd web
npm install
npm run build
```

Necesita Node.js 18 o superior. El resultado va a `web/build`, que es lo que el recurso
sirve realmente. La carpeta `web/node_modules`, si está, se puede borrar: `npm install`
la vuelve a crear.

## Problemas frecuentes

**«ox_inventory requires the ox_lib resource»**
Falta `ox_lib` o arranca después del inventario. Corrige el orden en `server.cfg`.

**«UI has not been built»**
Falta `web/build/index.html`. Lo has borrado, o se perdió al descomprimir. Vuelve a
extraer el recurso, o compila la interfaz.

**Todos los iconos salen en blanco**
Has renombrado la carpeta. Tiene que llamarse exactamente `ox_inventory`. Si de verdad
necesitas otro nombre, ajusta `inventory:imagepath`.

**Un icono concreto sale en blanco, y el servidor es Linux**
Mayúsculas en el nombre del fichero. `web/images/Water.png` no vale para un objeto
llamado `water`. Pásalo a minúsculas.

**Los objetos no se guardan / los alijos se vacían al reiniciar**
`oxmysql` no está conectado, o el usuario de la base de datos no pudo ejecutar
`ALTER TABLE` en el primer arranque. Mira la consola al arrancar buscando errores SQL.

**El peso no se aplica / los jugadores lo cargan todo**
Comprueba que `inventory:weight` está puesto con `setr` (no `set`) y que ningún otro
recurso llama a `SetMaxWeight` con un valor enorme.

**«attempted to restrict slot … but … has no job restriction»**
Una casilla de `data/shops.lua` tiene `grade` pero la tienda no tiene `groups`. Añade
`groups` a la tienda o quita el `grade`.

**Un objeto no hace nada al usarlo**
Mira el aviso de arranque sobre integraciones opcionales. Seguramente no tienes
instalado el recurso que ese objeto necesita.

## Licencia

**Grid Inventory** es una versión modificada de
[**ox_inventory**](https://github.com/overextended/ox_inventory) de **Overextended**,
con licencia **GNU General Public License v3.0**.

- Obra original copyright © 2024 Overextended <https://github.com/overextended>
- Modificaciones copyright © 2026 prietodev

Las modificaciones están listadas en [`CHANGES.md`](CHANGES.md). Tanto la obra original
como las modificaciones se distribuyen bajo la GPL-3.0.

Este programa es software libre: puedes redistribuirlo y/o modificarlo bajo los términos
de la Licencia Pública General GNU publicada por la Free Software Foundation, en su
versión 3 o (a tu elección) cualquier versión posterior.

Se distribuye con la esperanza de que sea útil, pero **SIN NINGUNA GARANTÍA**, ni
siquiera la garantía implícita de COMERCIABILIDAD o IDONEIDAD PARA UN PROPÓSITO
PARTICULAR. Consulta la Licencia Pública General GNU para más detalles.

Deberías haber recibido una copia de la Licencia Pública General GNU junto con este
programa. Si no, visita <https://www.gnu.org/licenses/>.

**Qué significa esto para ti como usuario:** recibes el código fuente completo (está
todo aquí, nada cifrado ni ofuscado), puedes modificarlo libremente y puedes
redistribuirlo, siempre que lo mantengas bajo GPL-3.0 y conserves estos avisos.

El texto completo de la licencia está en [`LICENSE`](LICENSE).

Iconos de objetos: muchos fueron aportados por
[yaroph](https://forum.cfx.re/u/yaroph/) para uso libre con ox_inventory — ver
`web/images/readme.md`.

Documentación original (casi toda aplica también a esta versión):
<https://overextended.dev/ox_inventory>
