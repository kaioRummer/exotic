local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
inProgress = {}

src = {}
Tunnel.bindInterface("ph_coletefac", src)

local itemName = {
	{ item = "colete" },
	{ item = "algema" },
	{ item = "pendrive" },
	{ item = "capuz" },
	{ item = "cartao" }
}

-- DEVENVOLVIDO  BY  PH NEVES

RegisterServerEvent("ph_coletefac:weaponfactory")
AddEventHandler("ph_coletefac:weaponfactory",function(item)
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		for e,g in pairs(itemName) do
			if item == g.item then
				if not inProgress[src] then
					if item == "colete" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("colete") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"couro") >= 2 then
								if vRP.getInventoryItemAmount(user_id,"linha") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"aco") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"tesoura") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"couro",2) and vRP.tryGetInventoryItem(user_id,"linha",2) and vRP.tryGetInventoryItem(user_id,"aco",2) and vRP.tryGetInventoryItem(user_id,"tesoura",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"colete",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou um <b>Colete</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Couro</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Linha</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aço</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Tesoura</b> o suficiente.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "algema" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("algema") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"aco") >= 4 then
								if vRP.getInventoryItemAmount(user_id,"aluminio") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"furadeira") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"chave") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"aco",4) and vRP.tryGetInventoryItem(user_id,"aluminio",2) and vRP.tryGetInventoryItem(user_id,"furadeira",2) and vRP.tryGetInventoryItem(user_id,"chave",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"algema",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>Algema</b>.")
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
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Furadeira</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Chave</b> o suficiente.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "pendrive" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pendrive") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"plastico") >= 2 then
								if vRP.getInventoryItemAmount(user_id,"aluminio") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"cobre") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"chip") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"plastico",2) and vRP.tryGetInventoryItem(user_id,"aluminio",2) and vRP.tryGetInventoryItem(user_id,"cobre",2) and vRP.tryGetInventoryItem(user_id,"chip",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"pendrive",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou um <b>Pendrive</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Plastico</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aluminio</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Cobre</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Chip</b> o suficiente.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end
						
						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "capuz" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("capuz") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"couro") >= 2 then
								if vRP.getInventoryItemAmount(user_id,"linha") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"cordas") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"tesoura") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"couro",2) and vRP.tryGetInventoryItem(user_id,"linha",2) and vRP.tryGetInventoryItem(user_id,"corda",2) and vRP.tryGetInventoryItem(user_id,"tesoura",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"capuz",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou um <b>Capuz</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Couro</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Linha</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corda</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Teroura</b> o suficiente.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "cartao" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cartao") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"plastico") >= 2 then
								if vRP.getInventoryItemAmount(user_id,"cobre") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"aluminio") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"chip") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"plastico",2) and vRP.tryGetInventoryItem(user_id,"cobre",2) and vRP.tryGetInventoryItem(user_id,"aluminio",2) and vRP.tryGetInventoryItem(user_id,"chip",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"cartao",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou um <b>Cartão</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Plastico</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Cobre</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Aluminio</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Chip</b> o suficiente.")
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

function src.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"colete.permissao") then
		return true
	end
end

-- DEVENVOLVIDO  BY  PH NEVES