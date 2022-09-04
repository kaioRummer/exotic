local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
inProgress = {}

src = {}
Tunnel.bindInterface("ph_gunsfac", src)

local itemName = {
	{ item = "ahk" },
	{ item = "five" },
	{ item = "tec9" },
	{ item = "uzi" },
	{ item = "famas" },
	{ item = "ak47" },
	{ item = "akm" },
	{ item = "g36" }
}

-- DEVENVOLVIDO  BY  PH NEVES

RegisterServerEvent("ph_gunsfac:weaponfactory")
AddEventHandler("ph_gunsfac:weaponfactory",function(item)
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		for e,g in pairs(itemName) do
			if item == g.item then
				if not inProgress[src] then
					if item == "ahk" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_SNSPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"corpopistol") >= 4 then
								if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 4 then
									if vRP.getInventoryItemAmount(user_id,"gatilho") >= 1 then
										if vRP.getInventoryItemAmount(user_id,"molas") >= 1 then
											if vRP.tryGetInventoryItem(user_id,"corpopistol",4) and vRP.tryGetInventoryItem(user_id,"placa-metal",4) and vRP.tryGetInventoryItem(user_id,"gatilho",1) and vRP.tryGetInventoryItem(user_id,"molas",1) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wbody|WEAPON_SNSPISTOL",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>HK</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Molas</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Gatilho</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Placa de Metal</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corpo de Pistola</b>.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "five" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"corpopistol") >= 6 then
								if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 6 then
									if vRP.getInventoryItemAmount(user_id,"gatilho") >= 1 then
										if vRP.getInventoryItemAmount(user_id,"molas") >= 2 then
											if vRP.tryGetInventoryItem(user_id,"corpopistol",6) and vRP.tryGetInventoryItem(user_id,"placa-metal",6) and vRP.tryGetInventoryItem(user_id,"gatilho",1) and vRP.tryGetInventoryItem(user_id,"molas",2) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wbody|WEAPON_PISTOL_MK2",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>Five</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Molas</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Gatilho</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Placa de Metal</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corpo de Pistola</b>.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "tec9" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_MACHINEPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"corposub") >= 4 then
								if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 8 then
									if vRP.getInventoryItemAmount(user_id,"gatilho") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"molas") >= 3 then
											if vRP.tryGetInventoryItem(user_id,"corposub",4) and vRP.tryGetInventoryItem(user_id,"placa-metal",8) and vRP.tryGetInventoryItem(user_id,"gatilho",2) and vRP.tryGetInventoryItem(user_id,"molas",3) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wbody|WEAPON_MACHINEPISTOL",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>TEC-9</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Molas</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Gatilho</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Placa de Metal</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corpo de Sub</b>.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "uzi" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_MICROSMG") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"corposub") >= 6 then
								if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 10 then
									if vRP.getInventoryItemAmount(user_id,"gatilho") >= 2 then
										if vRP.getInventoryItemAmount(user_id,"molas") >= 4 then
											if vRP.tryGetInventoryItem(user_id,"corposub",6) and vRP.tryGetInventoryItem(user_id,"placa-metal",10) and vRP.tryGetInventoryItem(user_id,"gatilho",2) and vRP.tryGetInventoryItem(user_id,"molas",4) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wbody|WEAPON_MICROSMG",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>Uzi</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Molas</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Gatilho</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Placa de Metal</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corpo de Sub</b>.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "famas" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_BULLPUPRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"corporifle") >= 4 then
								if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 12 then
									if vRP.getInventoryItemAmount(user_id,"gatilho") >= 3 then
										if vRP.getInventoryItemAmount(user_id,"molas") >= 4 then
											if vRP.tryGetInventoryItem(user_id,"corporifle",4) and vRP.tryGetInventoryItem(user_id,"placa-metal",12) and vRP.tryGetInventoryItem(user_id,"gatilho",3) and vRP.tryGetInventoryItem(user_id,"molas",4) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(4000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wbody|WEAPON_BULLPUPRIFLE",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>Famas</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Molas</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Gatilho</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Placa de Metal</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corpo de Rifle</b>.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "ak47" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_ASSAULTRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"corporifle") >= 6 then
								if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 14 then
									if vRP.getInventoryItemAmount(user_id,"gatilho") >= 3 then
										if vRP.getInventoryItemAmount(user_id,"molas") >= 5 then
											if vRP.tryGetInventoryItem(user_id,"corporifle",6) and vRP.tryGetInventoryItem(user_id,"placa-metal",14) and vRP.tryGetInventoryItem(user_id,"gatilho",3) and vRP.tryGetInventoryItem(user_id,"molas",5) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(4000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wbody|WEAPON_ASSAULTRIFLE",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>AK47</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Molas</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Gatilho</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Placa de Metal</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corpo de Rifle</b>.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "akm" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_ASSAULTRIFLE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"corporifle") >= 8 then
								if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 17 then
									if vRP.getInventoryItemAmount(user_id,"gatilho") >= 3 then
										if vRP.getInventoryItemAmount(user_id,"molas") >= 6 then
											if vRP.tryGetInventoryItem(user_id,"corporifle",8) and vRP.tryGetInventoryItem(user_id,"placa-metal",17) and vRP.tryGetInventoryItem(user_id,"gatilho",3) and vRP.tryGetInventoryItem(user_id,"molas",6) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wbody|WEAPON_ASSAULTRIFLE_MK2",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>AKM</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Molas</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Gatilho</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Placa de Metal</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corpo de Rifle</b>.")
							end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
					
					elseif item == "g36" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_SPECIALCARBINE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"corporifle") >= 10 then
								if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 20 then
									if vRP.getInventoryItemAmount(user_id,"gatilho") >= 3 then
										if vRP.getInventoryItemAmount(user_id,"molas") >= 7 then
											if vRP.tryGetInventoryItem(user_id,"corporifle",10) and vRP.tryGetInventoryItem(user_id,"placa-metal",20) and vRP.tryGetInventoryItem(user_id,"gatilho",3) and vRP.tryGetInventoryItem(user_id,"molas",7) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wbody|WEAPON_SPECIALCARBINE",1)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou uma <b>Carambina</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Molas</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Gatilho</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Placa de Metal</b> o suficiente.")
								end
							else
								TriggerClientEvent("Notify",src,"negado","Você não tem <b>Corpo de Rifle</b>.")
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
	if vRP.hasPermission(user_id,"bratva.permissao") then
		return true
	end
end