fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
name 'ox_inventory'
author 'prietodev'
version '2.45.1-prietodev.1'
repository 'https://github.com/overextended/ox_inventory'
description 'Grid Inventory by prietodev - a redesign of ox_inventory (Overextended), GPL-3.0'

-- Grid Inventory by prietodev
--
-- A modified version of ox_inventory by Overextended.
-- Original work copyright (C) 2024 Overextended <https://github.com/overextended>
-- Modifications copyright (C) 2026 prietodev
--
-- Licensed under the GNU General Public License v3.0 or later. See LICENSE.
-- Modifications are listed in CHANGES.md as required by GPL-3.0 section 5(a).

dependencies {
    '/server:6116',
    '/onesync',
    'oxmysql',
    'ox_lib',
}

shared_script '@ox_lib/init.lua'

ox_libs {
    'locale',
    'table',
    'math',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'init.lua'
}

client_script 'init.lua'

ui_page 'web/build/index.html'

files {
    'client.lua',
    'server.lua',
    'locales/*.json',
    'web/build/index.html',
    'web/build/assets/*.js',
    'web/build/assets/*.css',
    'web/images/*.png',
    'modules/**/shared.lua',
    'modules/**/client.lua',
    'modules/bridge/**/client.lua',
    'data/*.lua',
}
