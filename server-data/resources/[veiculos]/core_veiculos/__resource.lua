client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

 resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

files {
	'data/addon1/vehicles_addon1.meta', --VEHICLES1
	'data/addon1/carvariations_addon1.meta', --VEHICLES1
	'data/addon1/carcols_addon1.meta', --VEHICLES1
	'data/addon1/handling_addon1.meta', --VEHICLES1
	'data/addon2/vehicles_addon2.meta', --VEHICLES2
	'data/addon2/carvariations_addon2.meta', --VEHICLES2
	'data/addon2/carcols_addon2.meta', --VEHICLES2
	'data/addon2/handling_addon2.meta', --VEHICLES2
}

data_file 'HANDLING_FILE' 'data/addon1/handling_addon1.meta' --VEHICLES1
data_file 'VEHICLE_METADATA_FILE' 'data/addon1/vehicles_addon1.meta' --VEHICLES1
data_file 'CARCOLS_FILE' 'data/addon1/carcols_addon1.meta' --VEHICLES1
data_file 'VEHICLE_VARIATION_FILE' 'data/addon1/carvariations_addon1.meta' --VEHICLES1
data_file 'HANDLING_FILE' 'data/addon2/handling_addon2.meta' --VEHICLES2
data_file 'VEHICLE_METADATA_FILE' 'data/addon2/vehicles_addon2.meta' --VEHICLES2
data_file 'CARCOLS_FILE' 'data/addon2/carcols_addon2.meta' --VEHICLES2
data_file 'VEHICLE_VARIATION_FILE' 'data/addon2/carvariations_addon2.meta' --VEHICLES2

client_script {
	'data/addon1/tuning_addon1.lua', --VEHICLES1
	'data/addon2/tuning_addon2.lua' --VEHICLES2
  }              