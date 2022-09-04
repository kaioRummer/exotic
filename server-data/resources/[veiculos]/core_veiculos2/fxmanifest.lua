client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'adamant'
game 'gta5'

files {
	"data/**/*",
	"data/**",
	"data/*",
	"data/**/handling.meta",
	"data/**/vehiclelayouts.meta",
	"data/**/vehicles.meta",
	"data/**/carcols.meta",
	"data/**/carvariations.meta",
	"audio/*",
	"audio/**/*",
}

client_script "tuning.lua"

-- METAS
data_file "HANDLING_FILE" "data/**/handling.meta"
data_file "VEHICLE_LAYOUTS_FILE" "data/**/vehiclelayouts.meta"
data_file "VEHICLE_METADATA_FILE" "data/**/vehicles.meta"
data_file "CARCOLS_FILE" "data/**/carcols.meta"
data_file "VEHICLE_VARIATION_FILE" "data/**/carvariations.meta"

-- AUDIO
data_file "AUDIO_WAVEPACK" "audio/elegyx/dlc_elegyx"
data_file "AUDIO_GAMEDATA" "audio/elegyx/elegyx_game.dat"
data_file "AUDIO_SOUNDDATA" "audio/elegyx/elegyx_sounds.dat"

--data_file "AUDIO_WAVEPACK" "audio/sigma/dlc_sigma3"
--data_file "AUDIO_GAMEDATA" "audio/sigma/sigma3_game.dat"
--data_file "AUDIO_SOUNDDATA" "audio/sigma/sigma3_sounds.dat"
--
--data_file "AUDIO_WAVEPACK" "audio/monroe/dlc_monroec"
--data_file "AUDIO_GAMEDATA" "audio/monroe/monroec_game.dat"
--data_file "AUDIO_SOUNDDATA" "audio/monroe/monroec_sounds.dat"
--
--data_file "AUDIO_WAVEPACK" "audio/sultan/dlc_sultan2c"
--data_file "AUDIO_GAMEDATA" "audio/sultan/sultan2c_game.dat"
--data_file "AUDIO_SOUNDDATA" "audio/sultan/sultan2c_sounds.dat"
--
--data_file "AUDIO_WAVEPACK" "audio/sentinel/dlc_sentinelsg4"
--data_file "AUDIO_GAMEDATA" "audio/sentinel/sentineldm_game.dat"
--data_file "AUDIO_SOUNDDATA" "audio/sentinel/sentineldm_sounds.dat"
--
--data_file "AUDIO_WAVEPACK" "audio/mf1/dlc_progenmf1"
--data_file "AUDIO_GAMEDATA" "audio/mf1/mf1_game.dat"
--data_file "AUDIO_SOUNDDATA" "audio/mf1/mf1_sounds.dat"
              