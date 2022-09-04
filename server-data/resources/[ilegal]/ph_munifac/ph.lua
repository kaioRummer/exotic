local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
inProgress = {}

src = {}
Tunnel.bindInterface("ph_munifac", src)

local itemName = {
	{ item = "ahk" },
	{ item = "ahkk" },
	{ item = "mfive" },
	{ item = "mmfive" },
	{ item = "mtec9" },
	{ item = "mmtec9" },
	{ item = "muzi" },
	{ item = "mmuzi" },
	{ item = "mfamas" },
	{ item = "mmfamas" },
	{ item = "mak47" },
	{ item = "mmak47" },
	{ item = "makm" },
	{ item = "mmakm" },
	{ item = "mg36" },
	{ item = "mmg36" }
}

-- DEVENVOLVIDO  BY  PH NEVES

RegisterServerEvent("ph_munifac:weaponfactory")
AddEventHandler("ph_munifac:weaponfactory",function(item)
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		for e,g in pairs(itemName) do
			if item == g.item then
				if not inProgress[src] then
					if item == "ahk" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SNSPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 10 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 10 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 25 then
											if vRP.tryGetInventoryItem(user_id,"polvora",10) and vRP.tryGetInventoryItem(user_id,"ferro",10) and vRP.tryGetInventoryItem(user_id,"capsula",25) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_SNSPISTOL",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De AHK</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "ahkk" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SNSPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 8 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 80 then
											if vRP.tryGetInventoryItem(user_id,"polvora",8) and vRP.tryGetInventoryItem(user_id,"ferro",2) and vRP.tryGetInventoryItem(user_id,"capsula",80) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_SNSPISTOL",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De AHK</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mfive" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 6 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 2 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 40 then
											if vRP.tryGetInventoryItem(user_id,"polvora",6) and vRP.tryGetInventoryItem(user_id,"ferro",2) and vRP.tryGetInventoryItem(user_id,"capsula",40) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_PISTOL_MK2",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De Five</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mmfive" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 12 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 4 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 80 then
											if vRP.tryGetInventoryItem(user_id,"polvora",12) and vRP.tryGetInventoryItem(user_id,"ferro",4) and vRP.tryGetInventoryItem(user_id,"capsula",80) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_PISTOL_MK2",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De Five</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mtec9" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MACHINEPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 8 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 3 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 40 then
											if vRP.tryGetInventoryItem(user_id,"polvora",8) and vRP.tryGetInventoryItem(user_id,"ferro",3) and vRP.tryGetInventoryItem(user_id,"capsula",40) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_MACHINEPISTOL",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De TEC-9</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mmtec9" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MACHINEPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 16 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 6 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 80 then
											if vRP.tryGetInventoryItem(user_id,"polvora",16) and vRP.tryGetInventoryItem(user_id,"ferro",6) and vRP.tryGetInventoryItem(user_id,"polvora",80) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_MACHINEPISTOL",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De TEC-9</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "muzi" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MICROSMG") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 10 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 4 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 40 then
											if vRP.tryGetInventoryItem(user_id,"polvora",10) and vRP.tryGetInventoryItem(user_id,"ferro",4) and vRP.tryGetInventoryItem(user_id,"capsula",40) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_MICROSMG",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De Uzi</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mmuzi" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MICROSMG") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 20 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 8 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 80 then
											if vRP.tryGetInventoryItem(user_id,"polvora",20) and vRP.tryGetInventoryItem(user_id,"ferro",8) and vRP.tryGetInventoryItem(user_id,"capsula",80) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(3000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_MICROSMG",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De Uzi</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mfamas" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_BULLPUPRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 12 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 5 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 40 then
											if vRP.tryGetInventoryItem(user_id,"polvora",12) and vRP.tryGetInventoryItem(user_id,"ferro",5) and vRP.tryGetInventoryItem(user_id,"capsula",40) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(4000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_BULLPUPRIFLE",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De Famas</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mmfamas" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_BULLPUPRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 24 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 10 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 80 then
											if vRP.tryGetInventoryItem(user_id,"polvora",24) and vRP.tryGetInventoryItem(user_id,"ferro",10) and vRP.tryGetInventoryItem(user_id,"capsula",80) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(4000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_BULLPUPRIFLE",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De Famas</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
						
					elseif item == "mak47" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 14 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 6 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 40 then
											if vRP.tryGetInventoryItem(user_id,"polvora",14) and vRP.tryGetInventoryItem(user_id,"ferro",6) and vRP.tryGetInventoryItem(user_id,"capsula",40) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_ASSAULTRIFLE",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De AK47</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES
					
					elseif item == "mmak47" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 28 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 12 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 80 then
											if vRP.tryGetInventoryItem(user_id,"polvora",28) and vRP.tryGetInventoryItem(user_id,"ferro",12) and vRP.tryGetInventoryItem(user_id,"capsula",80) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_ASSAULTRIFLE",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De AK47</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "makm" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 18 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 7 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 40 then
											if vRP.tryGetInventoryItem(user_id,"polvora",18) and vRP.tryGetInventoryItem(user_id,"ferro",7) and vRP.tryGetInventoryItem(user_id,"capsula",40) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_ASSAULTRIFLE_MK2",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De AKM</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mmakm" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 36 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 14 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 80 then
											if vRP.tryGetInventoryItem(user_id,"polvora",36) and vRP.tryGetInventoryItem(user_id,"ferro",14) and vRP.tryGetInventoryItem(user_id,"capsula",80) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_ASSAULTRIFLE_MK2",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De AKM</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mg36" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SPECIALCARBINE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 18 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 8 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 40 then
											if vRP.tryGetInventoryItem(user_id,"polvora",18) and vRP.tryGetInventoryItem(user_id,"ferro",8) and vRP.tryGetInventoryItem(user_id,"capsula",40) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_SPECIALCARBINE",40)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>40 Munição De G36</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
								end
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
						end

						-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "mmg36" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SPECIALCARBINE") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"polvora") >= 35 then
								if vRP.getInventoryItemAmount(user_id,"ferro") >= 16 then
									if vRP.getInventoryItemAmount(user_id,"capsula") >= 80 then
											if vRP.tryGetInventoryItem(user_id,"polvora",35) and vRP.tryGetInventoryItem(user_id,"ferro",16) and vRP.tryGetInventoryItem(user_id,"capsula",80) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(5000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"wammo|WEAPON_SPECIALCARBINE",80)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou <b>80 Munição De G36</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Pólvora</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Ferro</b> o suficiente.")
									end
								else
									TriggerClientEvent("Notify",src,"negado","Você não tem <b>Capsula</b> o suficiente.")
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
	if vRP.hasPermission(user_id,"mafia.permissao") then
		return true
	end
end