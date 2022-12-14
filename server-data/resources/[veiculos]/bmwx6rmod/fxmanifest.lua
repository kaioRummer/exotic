client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'adamant'
game 'gta5'

files {
	"data/handling.meta",
	"data/vehiclelayouts.meta",
	"data/vehicles.meta",
	"data/carcols.meta",
	"data/carvariations.meta"
}

client_script "data/tuning.lua"

data_file "HANDLING_FILE" "data/handling.meta"
data_file "VEHICLE_LAYOUTS_FILE" "data/vehiclelayouts.meta"
data_file "VEHICLE_METADATA_FILE" "data/vehicles.meta"
data_file "CARCOLS_FILE" "data/carcols.meta"
data_file "VEHICLE_VARIATION_FILE" "data/carvariations.meta"              