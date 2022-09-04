fx_version 'adamant'
game 'gta5'
ui_page "nui/index.html"

shared_scripts {
	"vehlist.lua",
	"config.lua"
}

client_scripts {
	"@vrp/lib/utils.lua",
	"client-side/*"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server-side/*",
}

files {
	"nui/**",

}