local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

--[ E ]----------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('e', function(source,args,rawCommand)
	if not vRPclient.checkAcao(source) then
		TriggerClientEvent("emotes",source,args[1])
	end
end)

--[ E2 ]---------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('e2', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "administrador.permissao") or vRP.hasPermission(user_id, "manager.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent("emotes",nplayer,args[1])
		end
	end
end)
------------------------------------------------------------
-- /e3   server.lua do vrp_animacoes
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('e3', function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"mindmaster.permissao") then
        if args[2] then
            local nplayer = vRP.getUserSource(parseInt(args[2]))
            if nplayer then
                TriggerClientEvent("emotes",nplayer,args[1])
            end
        end
    end
end, false)

--[ PANO ]-------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("tryclean")
AddEventHandler("tryclean",function(nveh)
	TriggerClientEvent("syncclean",-1,nveh)
end)