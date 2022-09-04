fx_version 'bodacious'
game 'gta5'

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/ui.css',
    'ui/ui.js',
	'ui/img/*'
}

client_scripts {
	'@vrp/lib/utils.lua',
	'client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}

