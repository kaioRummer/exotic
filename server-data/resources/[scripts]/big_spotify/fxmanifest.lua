fx_version 'adamant'
game {'gta5'}

author 'Pequi Shop'
description 'Script for audio system'
version '1.0.3'

ui_page "html/index.html"

server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server/sv_main.lua"
}

client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client/cl_main.lua"
}

files {
	"html/index.html",
	"html/js/*",
	"html/css/*",
	"html/img/**"
}

dependencies {
    'xsound'
}