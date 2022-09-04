fx_version 'adamant'
game 'gta5'


client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua",
	"GMZ-Roubo-Server.net.dll"
}

files {
	"Newtonsoft.Json.dll"
}

clr_disable_task_scheduler 'not'
 
