fx_version 'bodacious'
game 'gta5'

name 'ph_rotas'
version '1.0'

shared_script {
	'Config/*',
}

client_scripts {
	'@vrp/lib/utils.lua',
	'Client/*',
}

server_scripts {
	'@vrp/lib/utils.lua',
	'ph.lua',
}