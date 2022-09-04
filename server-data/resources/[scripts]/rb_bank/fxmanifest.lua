fx_version 'cerulean'
game 'gta5'

ui_page 'web-side/index.html'

client_script{
    "@vrp/lib/utils.lua",
    "config/cfg_bank.lua",
    "client.lua"
}

server_script{
    "@vrp/lib/utils.lua",
    "server.lua"
}

files{
    "web-side/**/*",
    "web-side/*",
}