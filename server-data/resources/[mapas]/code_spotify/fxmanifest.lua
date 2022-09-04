fx_version 'adamant'
game {'gta5'}

author 'CodeX'
description 'The best sound system for Fivem'
version '1.0.0'

ui_page "index.html"

server_scripts {
	"@vrp/lib/utils.lua",
	"server/sv_main.lua",
	"functions.lua"
}

client_scripts {
	"@vrp/lib/utils.lua",
	"client/cl_main.lua",
	"functions.lua"
}

files {
	'index.html'
}

dependencies {
    'xsound'
}