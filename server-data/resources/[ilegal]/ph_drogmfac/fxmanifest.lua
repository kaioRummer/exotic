fx_version 'adamant'
game 'gta5'

author 'PH Neves'
contact 'PH#3989'
version '1.0.0'

ui_page 'nui/badland.html'

client_scripts {
	'@vrp/lib/utils.lua',
	'client-side/*.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'ph.lua'
}

files {
	'nui/badland.html',
	'nui/badland.css',
	'nui/badland.js',
	'nui/img/*.png'
}