local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
inProgress = {}

src = {}
Tunnel.bindInterface("ph_drogifac", src)

local itemName = {
	{ item = "coca" },
	{ item = "cocaa" },
	{ item = "embala1" },
	{ item = "embala2" }
}

-- DEVENVOLVIDO  BY  PH NEVES

RegisterServerEvent("ph_drogifac:weaponfactory")
AddEventHandler("ph_drogifac:weaponfactory",function(item)
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		for e,g in pairs(itemName) do
			if item == g.item then
				if not inProgress[src] then
					if item == "coca" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cocaina") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"folhasdecoca") >= 10 then
								if vRP.getInventoryItemAmount(user_id,"composto") >= 5 then
											if vRP.tryGetInventoryItem(user_id,"folhasdecoca",10) and vRP.tryGetInventoryItem(user_id,"composto",4) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"cocaina",50)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>50 Cocaína</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Folhas de Coca</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Composto</b> o suficiente.")
									end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "cocaa" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cocaina") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"folhasdecoca") >= 20 then
								if vRP.getInventoryItemAmount(user_id,"composto") >= 4 then
											if vRP.tryGetInventoryItem(user_id,"folhasdecoca",20) and vRP.tryGetInventoryItem(user_id,"composto",4) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"cocaina",100)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>100 Cocaína</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Folhas de Coca</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Composto</b> o suficiente.")
									end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "embala1" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cocaembalada") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"cocaina") >= 50 then
								if vRP.getInventoryItemAmount(user_id,"saquinhos") >= 5 then
											if vRP.tryGetInventoryItem(user_id,"cocaina",50) and vRP.tryGetInventoryItem(user_id,"saquinhos",5) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"cocaembalada",50)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>Cocaína Embalada</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Cocaína</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Saquinhos</b> o suficiente.")
									end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
					
					elseif item == "embala2" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cocaembalada") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"cocaina") >= 100 then
								if vRP.getInventoryItemAmount(user_id,"saquinhos") >= 10 then
											if vRP.tryGetInventoryItem(user_id,"cocaina",100) and vRP.tryGetInventoryItem(user_id,"saquinhos",10) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"cocaembalada",100)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>Cocaína Embalada</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Cocaína</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Saquinhos</b> o suficiente.")
									end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end
					end
				else
					TriggerClientEvent("Notify",src,"negado","Termine a produção em progresso para iniciar outra.")
				end
			end
		end
	end
end)

-- DEVENVOLVIDO  BY  PH NEVES

function src.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"vagos.permissao") then
		return true
	end
end