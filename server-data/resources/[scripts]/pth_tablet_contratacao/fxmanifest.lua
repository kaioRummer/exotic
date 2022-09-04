fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'petherbcl'

ui_page "nui/index.html"

client_scripts {
	'@vrp/lib/utils.lua',
	'client/*.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server/*.lua'
}

shared_script{
	'config/config.lua',
	'config/config_auth.lua'
}

files {
	"nui/**/*.png",
	"nui/**/*.jpg",
	"nui/**/*.css",
	"nui/**/*.js",
	"nui/**/*.ttf",
	"nui/**/*.woff2",
	"nui/**/**/*.js",
	"nui/**/**/*.css",
	"nui/**/**/*.ttf",
	"nui/**/**/*.woff2",
	"nui/*.html",
}

escrow_ignore {
	'config/config.lua',
}