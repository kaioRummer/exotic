local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

func = {}
Tunnel.bindInterface("gmz_roubo",func)

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhooklink = "https://discord.com/api/webhooks/797841469780131840/OEcjObOZIWPwwoKK5C712pg6eTh_nZJZIKsTbOoe5AfBGVzY3xZ3XAAEhS2Nu82yB6UH"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local ultimoAssaltoHora = {}
local recompensa = {}
local assalto = {}
local tempoAssalto = {}

local policias = nil

RegisterServerEvent("gmz:startRobbery")
AddEventHandler("gmz:startRobbery", function(source, rouboJson, setupJson)
    local user_id = vRP.getUserId(source)
    if user_id then
        local v = json.decode(rouboJson)
        local setup = json.decode(setupJson)    
        for k,c in pairs(setup) do
            Wait(1)
            if k == v.type then
                policias = vRP.getUsersByPermission("policia.permissao")
                if #policias < c.lspd then
                    TriggerClientEvent("Notify",source,"negado", "Número insuficiente de policiais ("..c.lspd..") no momento para iniciar o roubo.")
                else
                    if isEnabledToRob(k, c.tempoEspera) then
                        if hasNecessaryItemsToRob(user_id, c) then
                            if tryToRob(k, c, v, c.chanceSucesso) then
                                if hasNecessaryItemsToRob(user_id, c) then
                                    ultimoAssaltoHora[k] = os.time()
                                    recompensa[user_id] = c
                                    tempoAssalto[user_id] = c.tempo
                                    assalto[k] = true
                                    
                                    for n,i in pairs(recompensa[user_id].items) do
                                        i.receber = parseInt(math.random(i.min, i.max) / c.tempo)
                                    end
        
                                    SetTimeout(c.tempo * 1000,function()
                                        assalto[k] = false
                                    end)
            
                                    vRPclient._playAnim(source,false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
                                    TriggerClientEvent("iniciandoroubo", source, v.x, v.y, v.z, c.tempo, v.h)
                                    avisarPolicia("Roubo em Andamento", "Assalto a "..v.type.." em andamento, verifique o ocorrido.", v.x, v.y, v.z, v.type)
                                    SendWebhookMessage(webhooklink, "```ID: "..user_id.." começou um assalto ao "..v.type.."```")
                                end
                            else
                                TriggerClientEvent("Notify", source, "sucesso", "Você não conseguiu abrir o cofre, é melhor correr!")
                            end
                        end
                    else
                        local tempoRestante = getRemaningTime(k, c.tempoEspera)
                        TriggerClientEvent("Notify", source, "sucesso", "Você ainda deve aguardar "..tempoRestante.." segundos para realizar a ação.")
                    end
                end
            end
        end
    end
end)

function func.checkRobbery(v, setup)
local source = source
local user_id = vRP.getUserId(source)
if user_id then

        for k,c in pairs(setup) do
             Wait(1)
             if k == v.type then
                 policias = vRP.getUsersByPermission("policia.permissao")
                 if #policias < c.lspd then
                     TriggerClientEvent("Notify",source,"negado", "Número insuficiente de policiais ("..c.lspd..") no momento para iniciar o roubo.")
                 else
                     if isEnabledToRob(k, c.tempoEspera) then
                         if hasNecessaryItemsToRob(user_id, c) then
                             if tryToRob(k, c, v, c.chanceSucesso) then
                                 if hasNecessaryItemsToRob(user_id, c) then
                                     ultimoAssaltoHora[k] = os.time()
                                     recompensa[user_id] = c
                                     tempoAssalto[user_id] = c.tempo
                                     assalto[k] = true
                                    
                                     for n,i in pairs(recompensa[user_id].items) do
                                         i.receber = parseInt(math.random(i.min, i.max) / c.tempo)
                                     end
        
                                     SetTimeout(c.tempo * 1000,function()
                                        assalto[k] = false
                                     end)
            
                                     vRPclient._playAnim(source,false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
                                     TriggerClientEvent("iniciandoroubo", source, v.x, v.y, v.z, c.tempo, v.h)
                                     avisarPolicia("Roubo em Andamento", "Tentativa de assalto a "..v.type..", verifique o ocorrido.", v.x, v.y, v.z, v.type)
                                 end
                             else
                                 TriggerClientEvent("Notify", source, "sucesso", "Você não conseguiu abrir o cofre, é melhor correr!")
                             end
                         end
                     else
                         local tempoRestante = getRemaningTime(k, c.tempoEspera)
                         TriggerClientEvent("Notify", source, "sucesso", "Você ainda deve aguardar "..tempoRestante.." segundos para realizar a ação.")
                     end
                 end
             end
         end
     end
 end

function tryToRob(k, c, v, chance)
    if chance then
        if chance < 100 then
            local r = math.random(0, 100)
            print('Chance de roubar: '..chance.. "% | obtido: "..r.."%");
            if r <= chance then
                return true
            else
                ultimoAssaltoHora[k] = (os.time() - (c.tempoEspera * 60) + 30)
                avisarPolicia("Tentativa de Assalto", "Tentativa de assalto fracassada em "..v.type..", verifique o ocorrido.", v.x, v.y, v.z, v.type)
                return false
            end
        end
        return true
    end
    return true
end

function func.cancelRobbery()
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        tempoAssalto[user_id] = nil
        recompensa[user_id] = nil
        local policia = vRP.getUsersByPermission("policia.permissao")
        for l,w in pairs(policia) do
			local player = vRP.getUserSource(parseInt(w))
			local playerId = vRP.getUserId(player)
            if player then
				async(function()
					TriggerClientEvent('blip:remover:assalto',player)
					TriggerClientEvent('chatMessage',player,"10-43",{65,130,255},"O assaltante saiu correndo. ("..user_id..")")
					vRP.log2("roubo", "Assalto Cancelado", "O jogador "..user_id.." cancelou o assalto.", user_id)
				end)
			end
		end
    end
end

function getRemaningTime(k, tempoEspera)
    local t = ((os.time() - ultimoAssaltoHora[k]) - tempoEspera * 60) * -1
    return t
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
        for k,v in pairs(assalto) do
            if assalto[k] then
                for p,l in pairs(recompensa) do
                    if tempoAssalto[p] then
                        if tempoAssalto[p] > 0 then

                            for n,i in pairs(recompensa[p].items) do
                                vRP.giveInventoryItem(p, n, i.receber)
                            end
    
                            tempoAssalto[p] = tempoAssalto[p] - 1
                            if tempoAssalto[p] == 0 then
                                recompensa[p] = nil
                                tempoAssalto[p] = nil
                            end
                        end
                    end
                end
            end
        end
	end
end)

function isEnabledToRob(k, tempoEspera)
    if ultimoAssaltoHora[k] then
        if (os.time() - ultimoAssaltoHora[k]) < tempoEspera * 60 then
            return false
        else
            return true
        end
    end
    return true
end

function hasNecessaryItemsToRob(user_id, c)
    local source = vRP.getUserSource(user_id)
    if c.itemsNecessarios then
        local itensNecessarios = #c.itemsNecessarios
        local count = 0
        local data = vRP.getUserDataTable(user_id)
        if data and data.inventory then
            for k,v in pairs(c.itemsNecessarios) do
                if data.inventory[k] then
                    if data.inventory[k].amount >= v.qtd then

                    else
                        TriggerClientEvent("Notify",source, "sucesso", "Você precisa de "..v.qtd.."x "..vRP.itemNameList(k).." para iniciar")
                        -- TriggerClientEvent("Notify",source, "sucesso", "Você precisa de "..v.qtd.."x "..vRP.getItemName(k).." para iniciar")
                        return false
                    end
                else
                    TriggerClientEvent("Notify",source, "sucesso", "Você precisa de "..v.qtd.."x "..vRP.itemNameList(k).." para iniciar.")
                    -- TriggerClientEvent("Notify",source, "sucesso", "Você precisa de "..v.qtd.."x "..vRP.getItemName(k).." para iniciar.")
                    return false
                end
            end
        end
    end
    return true
end

function getNecessaryItemsToRob(user_id, c)
    local source = vRP.getUserSource(user_id)
    if c.itemsNecessarios then
        local itensNecessarios = #c.itemsNecessarios
        local count = 0
        local data = vRP.getUserDataTable(user_id)
        if data and data.inventory then
            for k,v in pairs(c.itemsNecessarios) do
                if data.inventory[k] then
                    if data.inventory[k].amount >= v.qtd then

                    else
                        TriggerClientEvent("Notify",source, "sucesso", "Você precisa de "..v.qtd.."x "..vRP.itemNameList(k).." para iniciar")
                        -- TriggerClientEvent("Notify",source, "sucesso", "Você precisa de "..v.qtd.."x "..vRP.getItemName(k).." para iniciar")
                        return false
                    end
                else
                    TriggerClientEvent("Notify",source, "sucesso", "Você precisa de "..v.qtd.."x "..vRP.itemNameList(k).." para iniciar.")
                    -- TriggerClientEvent("Notify",source, "sucesso", "Você precisa de "..v.qtd.."x "..vRP.getItemName(k).." para iniciar.")
                    return false
                end
            end
            for k,v in pairs(c.itemsNecessarios) do
                if k == "lockpick" then

                else
                    vRP.tryGetInventoryItem(user_id, k, v.qtd)
                end
            end
        end
    end
    return true
end

function avisarPolicia(titulo, msg, x, y, z, name)
	for l,w in pairs(policias) do
		local player = vRP.getUserSource(parseInt(w))
		if player then
			async(function()
				TriggerClientEvent('blip:criar:assalto',player,x,y,z, name)
                vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                TriggerClientEvent("Notify",player, "sucesso", msg)
				TriggerClientEvent('chatMessage',player,"10-43",{65,130,255},msg)
                
			end)
		end
    end
    local admins = vRP.getUsersByPermission("ac.permissao") 
    for l,w in pairs(admins) do
		local player = vRP.getUserSource(parseInt(w))
		if player then
			async(function()
				TriggerClientEvent('blip:criar:assalto',player,x,y,z, name)
				vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                TriggerClientEvent('chatMessage',player,"ADM",{65,130,255},msg)               
			end)
		end
    end
    
end