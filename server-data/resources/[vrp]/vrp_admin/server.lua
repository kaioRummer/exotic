local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookadmin = "https://canary.discord.com/api/webhooks/879705822094057482/utzFb5JKYQd0ZOG6mbrEbwY1yR19aIlwtwHJh2_ICpp9oWamnHzILXgYNBnyrq0eSPyW"
local webhookfac = "https://discordapp.com/api/webhooks/814354353661149204/AMsPufsrRcOZaGb_oJlZ7gQtLCCr4YEnd3DO08yJ0PPjJd0tGN6zM0-WCVKzvP35LUhV"
local webhookkeys = "https://discordapp.com/api/webhooks/814354353661149204/AMsPufsrRcOZaGb_oJlZ7gQtLCCr4YEnd3DO08yJ0PPjJd0tGN6zM0-WCVKzvP35LUhV"
local webhookcds = "https://discordapp.com/api/webhooks/814354353661149204/AMsPufsrRcOZaGb_oJlZ7gQtLCCr4YEnd3DO08yJ0PPjJd0tGN6zM0-WCVKzvP35LUhV"
local webhookblacklist = "https://discordapp.com/api/webhooks/827993956733288529/li3ldcEx7zWwSd_AP6E6p6bHOUfTR9FjH8XqiPFzA7G83QCZ_Lh_kRjj87GZ_P8T3EGn"


local webhook_registro = 'https://canary.discord.com/api/webhooks/879705822094057482/utzFb5JKYQd0ZOG6mbrEbwY1yR19aIlwtwHJh2_ICpp9oWamnHzILXgYNBnyrq0eSPyW'


function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent("adminLogs:Armamentos")
AddEventHandler("adminLogs:Armamentos",function(weapon)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
    	SendWebhookMessage(webhookblacklist,"```prolog\n[BLACKLIST ARMAS]: "..user_id.." " .. "\n[ARMA]: " .. weapon ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&641048265856647169>")  
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local player_customs = {}
RegisterCommand('vroupas',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local custom = vRPclient.getCustomization(source)
    if vRP.terPemissao(user_id,"admin.permissao") then
        if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else 
            local content = ""
            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."<br/>" 
            end

            player_customs[source] = true
            vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 4px; width: 250px; margin-top: 200px; margin-right: 50px; background: rgba(15,15,15,0.7); color: #ffff; font-weight: bold; }",content)
        end
    end
end)
-------------- bagulho das armas
local qtdAmmunition = 250 --// Quantidade de balas
local itemlist = {
    ["WEAPON_COMPACTRIFLE"] = { arg = "akcompacta" }, --// pra adicionais mais armas s처 pegar id modelo em https://wiki.rage.mp/index.php?title=Weapons // em arg= "nome spawn que vai ser a arma"
    ["WEAPON_PISTOL_MK2"] = { arg = "fiveseven" },
	["weapon_raypistol"] = { arg = "ray" },
    ["WEAPON_ASSAULTSMG"] = { arg = "smg" },
    ["WEAPON_SPECIALCARBINE"] = { arg = "parafal" },
    ["WEAPON_COMBATPISTOL"] = { arg = "glock" }, --// n찾o esquece, ultima arma n찾o tem virgula e as demais sim
	["WEAPON_ASSAULTRIFLE"] = { arg = "ak" }
}
RegisterCommand('arma',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
        if vRP.hasPermission(user_id,"dono.permissao") then --// troca a permiss찾o de quem pode usar o comando // pra ter log, so copiar uma log do vrp_admin la bo inicio e subistituir por "webhookarma" e o link
        if args[1] then
            for k,v in pairs(itemlist) do
                if v.arg == args[1] then
                    result = k
                    vRPclient.giveWeapons(source,{[result] = { ammo = qtdAmmunition }})
					SendWebhookMessage(webhookarma,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SPAWNOU]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DM (MENSAGEM PRIVADA)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dm',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(args[1]))
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] == nil then
            TriggerClientEvent("Notify",source,"negado","Necessário passar o ID após o comando, exemplo: <b>/dm 1</b>")
            return
        elseif nplayer == nil then
            TriggerClientEvent("Notify",source,"negado","O jogador não está online!")
            return
        end
        local mensagem = vRP.prompt(source,"Digite a mensagem:","")
        if mensagem == "" then
            return
        end
        TriggerClientEvent("Notify",source,"sucesso","Mensagem enviada com sucesso!")
        TriggerClientEvent('chatMessage',nplayer,"MENSAGEM DA ADMINISTRAÇÃO:",{50,205,50},mensagem)
        TriggerClientEvent("Notify",nplayer,"aviso","<b>Mensagem da Administração:</b> "..mensagem.."",30000)
    end
end)



-----------------------------
--VROUPAS2
-----------------------------
function IsNumber( numero )
    return tonumber(numero) ~= nil
end

RegisterCommand('vroupas2', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    local custom = vRPclient.getCustomization(source)
    if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
          if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else 
            local content = ""
            for k, v in pairs(custom) do
                if (IsNumber(k) and k <= 11) or k == "p0" or k == "p1" or k == "p2" or k == "p6" or k == "p7" then
                    if IsNumber(k) then
                        content = content .. '[' .. k .. '] = {' 
                    else
                        content = content .. '["' ..k..'"] = {'
                    end
                    local contador = 1
                    for y, x in pairs(v) do
                        if contador < #v then
                            content  = content .. x .. ',' 
                        else
                            content = content .. x 
                        end
                        contador = contador + 1
                    end
                    content = content .. "},\n"
                end
            end
            player_customs[source] = true
            vRPclient.prompt(source, 'vRoupas: ', content)
        end
    end
end)
---------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
----[Resetar Personagem  /reset "id"     (colocar no vrp_admin/server)]   
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('reset',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"dono.permissao") then
            if args[1] then
                local nplayer = vRP.getUserSource(parseInt(args[1]))
                local id = vRP.getUserId(nplayer)
                if id then
                    vRP.setUData(id,"vRP:spawnController",json.encode(1))
                    TriggerClientEvent("Notify",user_id,"sucesso","Você <b>resetou</b> o personagem do passaporte <b>"..vRP.format(parseInt(args[1])).."</b>.",5000)
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Blips
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if first_spawn then
        blips[source] = { source }
       TriggerClientEvent("blips:updateBlips",-1,blips)
        if vRP.terPemissao(user_id,"blips.permissao") then
            TriggerClientEvent("blips:adminStart",source)
        end
     end
 end)

AddEventHandler("playerDropped",function()
	if blips[source] then
		blips[source] = nil
		TriggerClientEvent("blips:updateBlips",-1,blips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KILL
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kill',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.terPemissao(user_id,"dono.permissao") or vRP.terPemissao(user_id,"admin.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                vRPclient.setHealth(nplayer,0)
				TriggerClientEvent("Notify",source,"importante","Você matou o passaporte "..args[1])
			end
		else
			args[1] = user_id
            vRPclient.setHealth(source,0)
		end	
		SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.name2.." \n[KILL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOQUE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('estoque',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"admin.permissao") then
        if args[1] and args[2] then
            vRP.execute("creative/set_estoque",{ vehicle = args[1], quantidade = args[2] })
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o carro <b>"..args[1].."</b>.") 
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD CAR
-----------------------------------------------------------------------------------------------------------------------------------------

local wlogaddcar = "https://canary.discord.com/api/webhooks/881117224398630925/A_Yk-fXCdQgLcbIbdw6M8IBABIgx5XLqA4XM7lpYXJN5-s8r2KNjCtFGdERZR3T-Rp3m"

RegisterCommand('addcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"dono.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/add_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) }) 
            --vRP.execute("creative/set_ipva",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) })
            TriggerClientEvent("Notify",source,"sucesso","Voce adicionou o veículo <b>"..args[1].."</b> para o Passaporte: <b>"..parseInt(args[2]).."</b>.") 
            SendWebhookMessage(wlogaddcar,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ADICIONOU]: "..args[1].." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------
-- REM CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('remcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"dono.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/rem_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time())  }) 
            TriggerClientEvent("Notify",source,"sucesso","Voce removeu o veículo <b>"..args[1].."</b> do Passaporte: <b>"..parseInt(args[2]).."</b>.") 
            SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOQUE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('estoque',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"admin.permissao") then
        if args[1] and args[2] then
            vRP.execute("creative/set_estoque",{ vehicle = args[1], quantidade = args[2] })
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o veículo <b>"..args[1].."</b>.") 
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UNCUFF
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uncuff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.terPemissao(user_id,"admin.permissao") then
			TriggerClientEvent("admcuff",source)
			SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /uncuff" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUEL
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('admfuel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.terPemissao(user_id,"dono.permissao") then
			TriggerClientEvent("admfuel",source)
			SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /admfuel" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end	
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SYNCAREA
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limpararea',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
    if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
        TriggerClientEvent("syncarea",-1,x,y,z)
		SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /limparea" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end)

RegisterCommand('limparinv',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
     if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		vRP.clearInventory(user_id)
		TriggerClientEvent("Notify",source,"sucesso","Você <b>limpou seu inventário</b> com sucesso!")
		SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /limparinv" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APAGAO
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('apagao',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.terPemissao(user_id,"admin.permissao") and args[1] ~= nil then
            local cond = tonumber(args[1])
            --TriggerEvent("cloud:setApagao",cond)
            TriggerClientEvent("cloud:setApagao",-1,cond)     
			SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /apagao" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")               
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RAIOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('raios', function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.terPemissao(user_id,"admin.permissao") and args[1] ~= nil then
            local vezes = tonumber(args[1])
            TriggerClientEvent("cloud:raios",-1,vezes)         
			SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /raios" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")  
        end
    end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TROCAR SEXO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('skin',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"dono.permissao") then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("skinmenu",nplayer,args[2])
                TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.")
				SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /skin no usuario "..args[1].."" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            end
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('debug',function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"admin.permissao") then
            TriggerClientEvent("ToggleDebug",player)
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Combustível
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('gas',function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if (vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"platina.permissao")) then
			TriggerClientEvent("admfuel",player)
			TriggerClientEvent("Notify",source,"sucesso","Tanque cheio")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DV
-----------------------------------------------------------------------------------------------------------------------------------------
--[[  RegisterCommand('dv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"polpar.permissao") or vRP.terPemissao(user_id,"mecanico.permissao") or vRP.terPemissao(user_id,"conce.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			print(vehicle)
			--TriggerEvent("nation:deleteVehicleSync",VehToNet(vehicle))
			TriggerEvent("nation:deleteVehicleSync",vehicle)
		end
	end
end)  ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteveh")
AddEventHandler("trydeleteveh",function(index)
	TriggerClientEvent("syncdeleteveh",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEOBJ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
    TriggerClientEvent("syncdeleteobj",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local vehicle = vRPclient.getNearestVehicle(source,11)
	if vehicle then
		if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") or vRP.terPemissao(user_id,"vip.permissao")then
			SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /fix" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			TriggerClientEvent('reparar',source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------

local wloggod = "https://canary.discord.com/api/webhooks/881112520901943386/R49_lQd2sY-SP3AInUcUfUf0SBoiGie75ThJ0w8qk4iEROOiekegRT1fKTKB6XW6AUKv"


RegisterCommand('god',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"suporte.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
				SendWebhookMessage(wloggod,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /god no ID: "..args[1].."" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                vRPclient.killGod(nplayer)
                vRPclient.setHealth(nplayer,400)
                TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
            end
        else
			SendWebhookMessage(wloggod,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /god" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            vRPclient.killGod(source)
            vRPclient.setHealth(source,400)
            TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
            --vRPclient.setArmour(source,100)
        end
    end
end)

RegisterCommand('cdscu',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"admin.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                vRPclient.killGod(nplayer)
                vRPclient.setHealth(nplayer,400)
                TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
            end
        else
            vRPclient.killGod(source)
            vRPclient.setHealth(source,400)
            TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
            vRPclient.setArmour(source,100)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('godall',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"dono.permissao") then
		SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /godall" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
            	vRPclient.killGod(id)
				vRPclient.setHealth(id,400)
				TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
				print(id)
            end
        end
    end
end)
--[ HASH ]--------------------------------------------------------------------------------------------------------------------

RegisterCommand('hash',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent('vehash',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tuning',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		TriggerClientEvent('vehtuning',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('wl',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"suporte.permissao") or vRP.terPemissao(user_id,"wl.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
        if args[1] then
            vRP.setWhitelisted(parseInt(args[1]),true)
            TriggerClientEvent("Notify",source,"sucesso","Voce aprovou o passaporte <b>"..args[1].."</b> na whitelist.")
            SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[APROVOU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unwl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"suporte.permissao") or vRP.terPemissao(user_id,"mod.permissao")  then
		if args[1] then
			vRP.setWhitelisted(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce retirou o passaporte <b>"..args[1].."</b> da whitelist.")
			SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kick',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			local id = vRP.getUserSource(parseInt(args[1]))
			if id then
				vRP.kick(id,"Você foi expulso da cidade.")
				TriggerClientEvent("Notify",source,"sucesso","Voce kickou o passaporte <b>"..args[1].."</b> da cidade.")
				SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[KICKOU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kickall',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"admin.permissao") then
		SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /kickall" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
                vRP.kick(id,"Você foi vitima do terremoto.")
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------

local wlogban = "https://canary.discord.com/api/webhooks/881115498312519740/5IV1AyT_8oyBikqyz2jK1_4ePPo1Z5EDzEKzCxE26RzM_GRKEDn2GQtvTf68z4Hucl0V"

RegisterCommand('ban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			local id = vRP.getUserSource(parseInt(args[1]))
			vRP.setBanned(parseInt(args[1]),true)
			vRP.kick(id,"Você foi expulso da cidade.")
			TriggerClientEvent("Notify",source,"sucesso","Voce baniu o passaporte <b>"..args[1].."</b> da cidade.")
			SendWebhookMessage(wlogban,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[BANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------

local wlogunban = "https://canary.discord.com/api/webhooks/881116723552600174/wtZJ_LSOihrDcNdsexNYe6qlaRog6WoeBX7b2NMcTtldUiW_QrGem4t5fW4C_w9ZMCRp"

RegisterCommand('unban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce desbaniu o passaporte <b>"..args[1].."</b> da cidade.")
			SendWebhookMessage(wlogunban,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESBANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEY
-----------------------------------------------------------------------------------------------------------------------------------------

local wlogmoney = "https://canary.discord.com/api/webhooks/879706477537919026/mvAIxaODdR7TgwKU9oqp252VotCjJxD9BZr-motNIgDfeTUNVNAUZf-e3md-d59XMqi2"

RegisterCommand('money',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"dono.permissao") then
		if args[1] then
			vRP.giveMoney(user_id,parseInt(args[1]))
			SendWebhookMessage(wlogmoney,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Usou o comando /money]: $"..vRP.format(parseInt(args[1])).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"suporte.permissao") or vRP.terPemissao(user_id,"mod.permissao") or vRP.terPemissao(user_id,"gravar.permissao") then
		vRPclient.toggleNoclip(source)
		SendWebhookMessage(webhook_registro,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /nc" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ COORDENADAS ]------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		heading = GetEntityHeading(GetPlayerPed(-1))
		vRP.prompt(source,"Cordenadas:","['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z))
	end
end)

RegisterCommand('cds2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:",tD(x)..", "..tD(y)..", "..tD(z))
	end
end)

RegisterCommand('cds3',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:","{name='ATM', id=277, x="..tD(x)..", y="..tD(y)..", z="..tD(z).."},")
	end
end)

RegisterCommand('cds4',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:","x = "..tD(x)..", y = "..tD(y)..", z = "..tD(z))
	end
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDSH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cdsh',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		local lugar = vRP.prompt(source,"Lugar:","")
		if lugar == "" then
			return
		end
	    SendWebhookMessage(webhookcds,"```prolog\n[PASSAPORTE]: "..user_id.." \n[LUGAR]: "..lugar.." \n[CDSH]: ['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z)..", ['name'] = "..lugar..", \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS CORRIDAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("cds:corridas")
AddEventHandler("cds:corridas",function()
local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		SendWebhookMessage(webhookcds,"```prolog\n[] = { ['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z).." }, \r```")
	end
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------

local wloggroup = "https://canary.discord.com/api/webhooks/881117634287005756/LN8VdPKIj83cJCJXYTWygxqn55E6I41K4o0uzTt3avpA15zzU5QjjaYWTb298RgQQRP-"

RegisterCommand('group',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"dono.permissao") then
		if args[1] and args[2] then
			vRP.addUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")
			SendWebhookMessage(wloggroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------

local wlogungroup = "https://canary.discord.com/api/webhooks/881118060197605416/RsfpXLoeAjcvivRKtCPvosNI1FlHfU09Cy-xj4rWfYtzQIH_F8qeJYqv1AnZQhlhXrKM"

RegisterCommand('ungroup',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"dono.permissao") then
		if args[1] and args[2] then
			vRP.removeUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.")
			SendWebhookMessage(wlogungroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------

local wlogtptome = "https://canary.discord.com/api/webhooks/881113362447085568/vyF8rPVCLJoz4PGowc5ZIo_m4zgUjnnooCdMos5go-tlryCZhMOYCMf6CP_z4oAQKiBE"

RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then
				SendWebhookMessage(wlogtptome,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /tptome no jogador "..args[1].."" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				vRPclient.teleport(tplayer,x,y,z)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------

local wlogtpto = "https://canary.discord.com/api/webhooks/881113186995142657/uTPQb9l7r9Hg_g862pahnTWFoU1d27ZxG_V-kg9KSdOrlVzbyiKbWgbEuKSjS7YWJvQd"

RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"suporte.permissao") or vRP.terPemissao(user_id,"mod.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				SendWebhookMessage(wlogtpto,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /tpto no jogador "..args[1].."" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				vRPclient.teleport(source,vRPclient.getPosition(tplayer))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------

local wlogtpway = "https://canary.discord.com/api/webhooks/881112969478541384/rzsKZxL1nX3o1lvkuOW32uCR2bbgdckY10ufaPahPBYhxtVFr9ZQ6zkdIV_Xbodr8309"

RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"suporte.permissao") or vRP.terPemissao(user_id,"mod.permissao")  then
		TriggerClientEvent('tptoway',source)
		SendWebhookMessage(wlogtpway,"```prolog\n[ID]: "..user_id.."\n[INFO]: Utilizou o comando /tpway" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"dono.permissao") or vRP.terPemissao(user_id,"vendedor.permissao") then
		if args[1] then
			TriggerClientEvent('spawnarveiculo',source,args[1])
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SPAWNOU]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") then
		TriggerClientEvent('delnpcs',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
		SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MENSAGEM]: "..mensagem.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,50,50,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
		SetTimeout(60000,function()
			vRPclient.removeDiv(-1,"anuncio")
		end)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pon',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"admin.permissao") then
        local users = vRP.getUsers()
        local players = ""
        local quantidade = 0
        for k,v in pairs(users) do
            if k ~= #users then
                players = players..", "
            end
            players = players..k
            quantidade = quantidade + 1
        end
        TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{255,160,0},quantidade)
        TriggerClientEvent('chatMessage',source,"ID's ONLINE",{255,160,0},players)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP FACS
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADA
RegisterCommand('addpolicia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]: "..parseInt(args[1]).." \n[GRUPO]: ADA "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Recruta")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Policia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removeada',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderada.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..parseInt(args[1]).." \n[GRUPO]: ADA "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"ADA")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>ADA</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TDT Tropa da Turquia

local waddtdt = "https://canary.discord.com/api/webhooks/881089596484628530/WE_Z0altmrh7B0E7k6zL4daV7mbTVzoH-6iTaQcrCbJoLCeNE27mhJOlsZP6dKbqZEHy"

RegisterCommand('addtdt',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderTDT.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(waddtdt,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Tropa da Turquia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"TDT")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>TDT</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

local wremtdt = "https://canary.discord.com/api/webhooks/881089937645117460/zVGEZhBFCCEQLrnnzJ7dqdzSdJg-LqsSfK6Qt82Qkf84LoRdLuVwkDxJX007cU1uOQI_"

RegisterCommand('remtdt',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderTDT.permissao") or vRP.terPemissao(user_id,"mod.permissao")  then
		if args[1] then
			SendWebhookMessage(wremtdt,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Tropa da Turquia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"TDT")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>TDT</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--  TDB Tropa da Belgica

local waddtdb = "https://canary.discord.com/api/webhooks/881095364525035620/zdLKP2f_hajTE7Apo72zHQiZ-eVo2MgRovrnohuCyl5_ZxNu1azitU3KBUJfphXn9WpQ"

RegisterCommand('addtdb',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderTDB.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(waddtdb,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Tropa da Belgica "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"TDB")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>TDB</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

local wremtdb = "https://canary.discord.com/api/webhooks/881095906286530590/mcRgeg2dyRi1H48SNRm-6xVQ1L-ZIDt529ntdOQvg6zF0CZlp9A0CC0s74J95P49vd-Z"

RegisterCommand('remtdb',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderTDB.permissao") or vRP.terPemissao(user_id,"suporte.permissao") then
		if args[1] then
			SendWebhookMessage(wremtdb,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Tropa da Belgica "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"TDB")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> dos <b>TDB</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TDJ Tropa do Japão

local waddtdj = "https://canary.discord.com/api/webhooks/881097716040605696/xvdrIbD7AMZUpEt-G1Gm3eyYoA3G1XXbUj72orsGB1CjUXz-EClxF8LU_C6DqqP8pZsF"

RegisterCommand('addtdj',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderTDJ.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(waddtdj,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Tropa do Japão "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"TDJ")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>TDJ</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

local wremtdj = "https://canary.discord.com/api/webhooks/881098026754641950/gHtJeuL8haWTN0QHK6oFE5Yd6VPNiSBpRrojXUuEqPTuRd5QcANyP41XmwMzn1Z-2_Vs"


RegisterCommand('remtdj',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderTDJ.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(wremtdj,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Tropa do Japão "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"TDJ")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>TDJ</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TDF Tropa da França

local waddtdf = "https://canary.discord.com/api/webhooks/881099470178250762/AdF4a5Log7JfKrRPvjthl2njeaC278gDEfwx29-3XPbrWXpc4v5rmzU4RaCOFjC4J7a-"

RegisterCommand('addtdf',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderTDF.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(waddtdf,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Tropa da França "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"TDF")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>TDF</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

local wremtdf = "https://canary.discord.com/api/webhooks/881100185013456916/NATEAl9t94boPGjzsfNezuCkpr-_GwRERH-RDVFeuwQ_2Qx-b_zl78VCbl8Ig4WHmorv"


RegisterCommand('remtdf',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderTDF.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(wremtdf,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Tropa da França "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"TDF")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>TDF</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Mafia

local waddmafia = "https://canary.discord.com/api/webhooks/881101261934579783/kfLROwccFObeB8r0cUe4TxSSkuwpSTTajCOOl-4pNQFN8QOJaxSTCrdM8e4qscTiUcfl"

RegisterCommand('addmafia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidermafia.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(waddmafia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Mafia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Mafia")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Mafia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

local wremmafia = "https://canary.discord.com/api/webhooks/881102168084607018/bkepZcFaLzNSteZBfohWEyGQkVc3HqK7Z7AkHNUNGwNWRqCJ_v1UrG-9LTDAZOeqqeHF"


RegisterCommand('remmafia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidermafia.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(wremmafia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Mafia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Mafia")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> do <b>Mafia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Cartel

local waddcartel = "https://canary.discord.com/api/webhooks/881103239465037834/H67D4FkQXyvANI6391ITnmzDqLj7BNVawl-Yr55anyxerJeRhkUcmzSQLojaLv4w-Rer"

RegisterCommand('addcartel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidercartel.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(waddcartel,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Cartel "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Cartel")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Cartel</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

local wremcartel = "https://canary.discord.com/api/webhooks/881103559955976214/IqqiwKcyAslIVxyI46OIBdgZCdBvxQ5Xz6H32D09KqyrB0mRmboZfFgbLGPOK26fSQrA"

RegisterCommand('remcartel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidercartel.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(wremcartel,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Cartel "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Cartel")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> dos <b>Cartel</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Vanilla

local waddvanilla = "https://canary.discord.com/api/webhooks/881104754317615144/UocLBlOKsAe_eTw42B3s-NZcqpQeF8MfESERRS2dRMyveKF6knMMWcbKbXuNDBbrGFXo"

RegisterCommand('addvanilla',function(source,args,rawCommand) 
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidervanilla.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(waddvanilla,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Vanilla "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Vanilla")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Vanilla</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

local wremvanilla = "https://canary.discord.com/api/webhooks/881105082605776926/VXHta8d1JZ-oAUSDB5hTtFxWwh_OaSfxjVuYdN1t0FGN11uRRDuCRpdO5sKCxFHhMg9C"

RegisterCommand('remvanilla',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidervanilla.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(wremvanilla,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Vanilla "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Vanilla")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> dos <b>Vanilla</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Bennys

local waddbennys = "https://canary.discord.com/api/webhooks/881106215940276224/Co260mywbPokQrhZZOKjaa8qNgU9pN86endla9gT5B_Xu_vTgwVsk_3fxlQwxPOh5Opn"

RegisterCommand('addbennys',function(source,args,rawCommand) 
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderbennys.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(waddbennys,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Bennys "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Bennys")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Bennys</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

local wrembennys = "https://canary.discord.com/api/webhooks/881106578189713418/lAYDuebkPTagxUsxPTLX0viq_hnLK3yORGuqGJZP_7T1dOlrpEMBi7IefDM2wyaORr6k"

RegisterCommand('rembennys',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderbennys.permissao") or vRP.terPemissao(user_id,"mod.permissao") then
		if args[1] then
			SendWebhookMessage(wrembennys,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Bennys "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Bennys")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> dos <b>Bennys</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Life Invader
RegisterCommand('addtequilala',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidertequilala.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Tequilala "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Tequilala")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Tequilala</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removetequilala',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidertequilala.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Tequilala "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Tequilala")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>Tequilala</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MerryWeather
RegisterCommand('addmerryweather',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidermerryweather.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Lifeinvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Merryweather")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Merryweather</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removemerryweather',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidermerryweather.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Lifeinvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Merryweather")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>Merryweather</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Mecânico
RegisterCommand('addmecanico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"mecanicolider.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Mecanico "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Mecanico")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Mecanico</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removemecanico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"mecanicolider.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Mecanico "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Mecanico")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaMecanico")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> dos <b>Mecanico</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Benny's
RegisterCommand('addspeed',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"speedlider.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Speed "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Speed")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Speed</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removespeed',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"speedlider.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Speed "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Speed")
			vRP.removeUserGroup(parseInt(args[1]),"Paisanaspeed")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>Speed</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('addpolicia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Policia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Policia")
		end
	end
end)

RegisterCommand('removepolicia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Policia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Policia")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaPolicia")
		end
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addrecruta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Recruta "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Recruta")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Recruta</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removerecruta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Recruta "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Recruta")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaRecruta")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o <b>Recruta</b> ID <b>"..parseInt(args[1]).."</b> da <b>Polícia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addsoldado',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Soldado "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Soldado")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Soldado</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removesoldado',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Soldado "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Soldado")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaSoldado")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o <b>Soldado</b> ID <b>"..parseInt(args[1]).."</b> da <b>Polícia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addsargento',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Sargento "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Sargento")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Sargento</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removesargento',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Sargento "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Sargento")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaSargento")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o <b>Sargento</b> ID <b>"..parseInt(args[1]).."</b> da <b>Polícia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addtenente',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Tenente "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Tenente")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Tenente</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removetenente',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Tenente "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Tenente")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaTenente")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o <b>Tenente</b> ID <b>"..parseInt(args[1]).."</b> da <b>Polícia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addcapitao',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Capitao "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Capitão")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Capitão</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removecapitao',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Capitao "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Capitão")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaCapitão")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o <b>Capitão</b> ID <b>"..parseInt(args[1]).."</b> da <b>Polícia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addtencoronel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: TenCoronel "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"TenCoronel")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Ten. Coronel</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removetencoronel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: TenCoronel "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"TenCoronel")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaTenCoronel")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o <b>Ten. Coronel</b> ID <b>"..parseInt(args[1]).."</b> da <b>Polícia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addcoronel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Coronel "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Coronel")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Coronel</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removecoronel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Coronel "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Coronel")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaCoronel")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o <b>Coronel</b> ID <b>"..parseInt(args[1]).."</b> da <b>Polícia</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addfederal',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderfederal.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Policia Federal "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"PolicialFederal")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Polícia Federal</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removefederal',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderfederal.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Policia Federal "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"PolicialFederal")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaFederal")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>Polícia Federal</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addcivil',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidercivil.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Policia Civil "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"PolicialCivil")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Polícia Civil</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removecivil',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidercivil.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Policia Civil "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"PolicialCivil")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaCivil")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> da <b>Polícia Civil</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addbope',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderbope.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: BOPE "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"BOPE")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>BOPE</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removebope',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderbope.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: BOPE "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"BOPE")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaBOPE")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> do <b>BOPE</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addnews',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidernews.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: News "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"News")
		end
	end
end)

RegisterCommand('removenews',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"lidernews.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: News "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"News")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addbuscape',function(source,args,rawCommand) 
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderbuscape.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Buscape "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Buscape")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Buscapé</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removebuscape',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderbuscape.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Buscape "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Buscape")
			TriggerClientEvent("Notify",source,"negado","Você <b>removeu</b> o ID <b>"..parseInt(args[1]).."</b> dos <b>Buscapé</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addenfermeiro',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Enfermeiro "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Enfermeiro")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Enfermeiro</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removeenfermeiro',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Enfermeiro "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Enfermeiro")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaEnfermeiro")
			TriggerClientEvent("Notify",source,"negado","Você <b>demitiu</b> o <b>Enfermeiro</b> ID <b>"..parseInt(args[1]).."</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addparamedico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Paramedico "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Paramedico")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Paramedico</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removeparamedico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Paramedico "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Paramedico")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaParamedico")
			TriggerClientEvent("Notify",source,"negado","Você <b>demitiu</b> o <b>Paramedico</b> ID <b>"..parseInt(args[1]).."</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addamedico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Medico "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Medico")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Médico</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removemedico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Medico "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Medico")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaMedico")
			TriggerClientEvent("Notify",source,"negado","Você <b>demitiu</b> o <b>Médico</b> ID <b>"..parseInt(args[1]).."</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adddiretor',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Diretor "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Diretor")
			TriggerClientEvent("Notify",source,"sucesso","Você <b>setou</b> o ID <b>"..parseInt(args[1]).."</b> como <b>Diretor</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)

RegisterCommand('removediretor',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.terPemissao(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]:"..parseInt(args[1]).." \n[GRUPO]: Diretor "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Diretor")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaDiretor")
			TriggerClientEvent("Notify",source,"negado","Você <b>demitiu</b> o <b>Diretor</b> ID <b>"..parseInt(args[1]).."</b>.")
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FESTINHA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('festinha',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"mod.permissao") or vRP.terPemissao(user_id,"admin.permissao") then
        local identity = vRP.getUserIdentity(user_id)
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        vRPclient.setDiv(-1,"festinha"," @keyframes blinking {    0%{ background-color: #ff3d50; border: 2px solid #871924; opacity: 0.8; } 25%{ background-color: #d22d99; border: 2px solid #901f69; opacity: 0.8; } 50%{ background-color: #55d66b; border: 2px solid #126620; opacity: 0.8; } 75%{ background-color: #22e5e0; border: 2px solid #15928f; opacity: 0.8; } 100%{ background-color: #222291; border: 2px solid #6565f2; opacity: 0.8; }  } .div_festinha { font-size: 11px; font-family: arial; color: rgba(255, 255, 255,1); padding: 30px; bottom: 23%; right: 0%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; animation: blinking 1s infinite; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Festeiro(a): "..identity.name.." "..identity.firstname)
        SetTimeout(10000,function()
            vRPclient.removeDiv(-1,"festinha")
        end)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('festa',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"convite.permissao") then
	    if user_id then
	        local fcoords = vRP.prompt(source,"Quer ir para o festa?(Digite: SIM)","")
	        if fcoords ~= "SIM" or "sim" then
	            return
	        end
	        vRPclient.teleport(source,-182.75,969.12,236.13)	       
	    end
	    vRP.removeUserGroup(user_id, "Convite")
	end
end)

RegisterCommand('convidar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)	
	if args[1] then
		vRP.addUserGroup(parseInt(args[1]),"Convite")
		SendWebhookMessage(webhookconvite,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[CONVIDOU]:"..parseInt(args[1]).." \n[FESTA]: Magnum "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end		
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR cor
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('carcolor',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"admin.permissao") then
        local vehicle = vRPclient.getNearestVehicle(source,7)
        if vehicle then
            local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
            rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
            local r,g,b = table.unpack(splitString(rgb," "))
            TriggerClientEvent('vcolorv',source,vehicle,tonumber(r),tonumber(g),tonumber(b))
            
            TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Cor ^1alterada")
        end
    end
end) 
----------------
--REMOVER ARMA--
----------------
RegisterCommand('removearmas',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"dono.permissao") then
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
                TriggerClientEvent('limparArmas',id)
                print(id)
            end
        end
    end
end)
----------------------------------------------
--------------DV EM AREA----------------------
----------------------------------------------
RegisterCommand('dvall', function(a,b)
    user_id = vRP.getUserId(a)
    if vRP.terPemissao(user_id,'admin.permissao') then
        if tonumber(b[1]) then
            local vehicles = vRPclient.getNearestVehicles(a,tonumber(b[1]))
            for k,v in pairs(vehicles) do
                TriggerClientEvent('deleteVeh', a, k)
            end
            TriggerClientEvent('Notify',a, 'sucesso', '<b>Você deletou '.. tablelen(vehicles) ..'x veículos')
        else
            TriggerClientEvent('Notify',a, 'negado', 'Comando dado de forma incorreta, use a estrutura /dvall [raio]')
        end
    else
        TriggerClientEvent('Notify', a,'negado', 'Sem permissão!')
    end
end)

function tablelen(table)
    num = 0
    for k,v in pairs(table) do
        num = num + 1
    end
    return num
end


--------CLIENT-SIDE

RegisterNetEvent('deleteVeh')
AddEventHandler('deleteVeh', function(k)
    DeleteVehicle(k)
end)