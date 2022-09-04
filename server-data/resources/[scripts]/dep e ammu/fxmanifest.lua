shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'cerulean'
game 'gta5'

client_scripts {
  "@vrp/lib/utils.lua",
  'client.lua',
  'config.lua'
}

server_scripts {
  "@vrp/lib/utils.lua",
  'server.lua'
}

files {
  'web/**/*',
  'web/*'
}

ui_page 'web/index.html'


                            