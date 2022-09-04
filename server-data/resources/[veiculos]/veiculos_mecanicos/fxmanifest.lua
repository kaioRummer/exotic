client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'bodacious'
game 'gta5'

files {
    'data/**/**.meta',
    'data/**/**.meta',
    'data/**/**.meta',
    'data/**/**.meta',
    'data/**/**.meta',
}

data_file 'HANDLING_FILE' 'data/**/**.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/**.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/**.meta'
data_file 'CARCOLS_FILE' 'data/**/**.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/**.meta'

client_script {
    'data/**/**.lua',
    'data/**/**.lua',
}              