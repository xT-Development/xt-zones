fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

author 'xT Development'
description 'Zones'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'configs/client.lua',
    'modules/client/*.lua',
    'client/*.lua'
}

ui_page 'ui/index.html'

files {
    'ui/*.*',
    'configs/zones.json',
}

dependencies {
    'ox_lib'
}