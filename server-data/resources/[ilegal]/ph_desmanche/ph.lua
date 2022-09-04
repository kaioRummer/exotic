local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
inProgress = {}

src = {}
Tunnel.bindInterface("ph_desmanche", src)

local itemName = {
	{ item = "placa" },
	{ item = "masterpick" },
	{ item = "nitro" },
	{ item = "lockpick" }
}

-- DEVENVOLVIDO  BY  PH NEVES

RegisterServerEvent("ph_desmanche:weaponfactory")
AddEventHandler("ph_desmanche:weaponfactory",function(item)
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		for e,g in pairs(itemName) do
			if item == g.item then
				if not inProgress[src] then
					if item == "placa" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("placa") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"aluminio") >= 4 then
								if vRP.getInventoryItemAmount(user_id,"aco") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"tinta") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"furadeira") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"aluminio",4) and vRP.tryGetInventoryItem(user_id,"aco",2) and vRP.tryGetInventoryItem(user_id,"tinta",2) and vRP.tryGetInventoryItem(user_id,"furadeira",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"placa",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>Placa Clonada</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aluminio</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aço</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Tinta</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Furadeira</b> o suficiente.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "masterpick" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("masterpick") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"aluminio") >= 4 then
								if vRP.getInventoryItemAmount(user_id,"plastico") >= 4 then
									if vRP.getInventoryItemAmount(user_id,"aco") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"chave") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"aluminio",4) and vRP.tryGetInventoryItem(user_id,"plastico",4) and vRP.tryGetInventoryItem(user_id,"aco",2) and vRP.tryGetInventoryItem(user_id,"chave",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"masterpick",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>Masterpick</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aluminio</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aço</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Tinta</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Furadeira</b> o suficiente.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "nitro" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("nitro") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"aco") >= 2 then
								if vRP.getInventoryItemAmount(user_id,"aluminio") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"tinta") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"co2") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"aco",2) and vRP.tryGetInventoryItem(user_id,"aluminio",2) and vRP.tryGetInventoryItem(user_id,"tinta",2) and vRP.tryGetInventoryItem(user_id,"co2",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"nitro",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou um <b>Nitro</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aço</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aluminio</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Tinta</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>CO2</b> o suficiente.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "lockpick" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("nitro") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"aluminio") >= 2 then
								if vRP.getInventoryItemAmount(user_id,"plastico") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"aco") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"chave") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"aluminio",2) and vRP.tryGetInventoryItem(user_id,"plastico",2) and vRP.tryGetInventoryItem(user_id,"aco",2) and vRP.tryGetInventoryItem(user_id,"chave",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"nitro",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>Lockpick</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aluminio</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Plastico</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aço</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Chave</b> o suficiente.")
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
	if vRP.hasPermission(user_id,"driftking.permissao") or vRP.hasPermission(user_id,"motoclub.permissao") then
		return true
	end
end