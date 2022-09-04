fx_version 'cerulean'
game 'gta5'

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client-side/*.lua"
}
files {
	"nui/*",
	"nui/img/*",
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server-side/*.lua"
}