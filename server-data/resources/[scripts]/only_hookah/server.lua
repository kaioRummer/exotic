local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")

RegisterNetEvent("shisha:pay")
AddEventHandler("shisha:pay", function(entity)
local xPlayer = vRP.getUserId(source)
	vRP.tryPayment(xPlayer,20)
end)

RegisterServerEvent("eff_smokes")
AddEventHandler("eff_smokes", function(entity)
	TriggerClientEvent("c_eff_smokes", -1, entity)
end)

RegisterCommand("teste", function(source, args, rawCommand)
    local xPlayer = vRP.getUserId(source)
	if vRP.tryGetInventoryItem(xPlayer,"maconha",1) then
		TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
		TriggerClientEvent("only_hooka:spawn", -1, entity)
	end
end)

RegisterCommand("deletehookah", function(source, args, rawCommand)
	local xPlayer = vRP.getUserId(source)
	TriggerClientEvent("only_hooka:delete", -1, entity)
	xPlayer.addInventoryItem("hookah", 1)
end)