local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
inProgress = {}

src = {}
Tunnel.bindInterface("ph_vendailegal", src)

local itemName = {
	{ item = "cm" },
	{ item = "rl" },
	{ item = "cl" },
	{ item = "ps" },
	{ item = "cr" },
	{ item = "ct" },
	{ item = "sm" },
	{ item = "cg" }
}

-- DEVENVOLVIDO  BY  PH NEVES

RegisterServerEvent("ph_vendailegal:weaponfactory")
AddEventHandler("ph_vendailegal:weaponfactory",function(item)
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		for e,g in pairs(itemName) do
			if item == g.item then
				if not inProgress[src] then
					if item == "cm" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dinheirosujo") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"cameraroubada") >= 1 then
								if vRP.tryGetInventoryItem(user_id,"cameraroubada",1) then
									TriggerClientEvent("progress",src,1000,"fazendo")
										vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
										inProgress[src] = true
									TriggerClientEvent("F6Cancel",src,true)
									SetTimeout(2000,function()
										vRPclient._stopAnim(src,false)
										vRP.giveInventoryItem(user_id,"dinheirosujo",500)
									TriggerClientEvent("Notify",src,"sucesso","Você vendeu <b>Câmera Roubada</b>.")
										inProgress[src] = false
									TriggerClientEvent("F6Cancel",src,false)
								end)
							end
						else
						TriggerClientEvent("Notify",src,"negado","Você não tem <b>Câmera Roubada</b> na mochila.")
					end
				else
				TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
			end
						
			-- DEVENVOLVIDO  BY  PH NEVES

		    elseif item == "rl" then
			    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dinheirosujo") <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.getInventoryItemAmount(user_id,"relogioroubado") >= 1 then
						if vRP.tryGetInventoryItem(user_id,"relogioroubado",1) then
							TriggerClientEvent("progress",src,1000,"fazendo")
								vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
								inProgress[src] = true
							TriggerClientEvent("F6Cancel",src,true)
							SetTimeout(2000,function()
								vRPclient._stopAnim(src,false)
								vRP.giveInventoryItem(user_id,"dinheirosujo",700)
							TriggerClientEvent("Notify",src,"sucesso","Você vendeu <b>Rélogio Roubado</b>.")
								inProgress[src] = false
							TriggerClientEvent("F6Cancel",src,false)
						end)
					end
				else
				TriggerClientEvent("Notify",src,"negado","Você não tem <b>Rélogio Roubada</b> na mochila.")
			end
		else
		TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
	end

	-- DEVENVOLVIDO  BY  PH NEVES
						
           elseif item == "cl" then
			    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dinheirosujo") <= vRP.getInventoryMaxWeight(user_id) then
				    if vRP.getInventoryItemAmount(user_id,"colaroubado") >= 1 then
					    if vRP.tryGetInventoryItem(user_id,"colaroubado",1) then
				            TriggerClientEvent("progress",src,1000,"fazendo")
					            vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
					            inProgress[src] = true
				            TriggerClientEvent("F6Cancel",src,true)
				            SetTimeout(2000,function()
					            vRPclient._stopAnim(src,false)
					            vRP.giveInventoryItem(user_id,"dinheirosujo",1000)
				            TriggerClientEvent("Notify",src,"sucesso","Você vendeu <b>Colar Roubada</b>.")
					            inProgress[src] = false
					        TriggerClientEvent("F6Cancel",src,false)
			            end)
		            end
	            else
	            TriggerClientEvent("Notify",src,"negado","Você não tem <b>Colar Roubada</b> na mochila.")
            end
        else
	    TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
    end
					
	-- DEVENVOLVIDO  BY  PH NEVES

            elseif item == "ps" then
	            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dinheirosujo") <= vRP.getInventoryMaxWeight(user_id) then
		            if vRP.getInventoryItemAmount(user_id,"psproubado") >= 1 then
			            if vRP.tryGetInventoryItem(user_id,"psproubado",1) then
				            TriggerClientEvent("progress",src,1000,"fazendo")
							    vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							    inProgress[src] = true
				            TriggerClientEvent("F6Cancel",src,true)
				            SetTimeout(2000,function()
					            vRPclient._stopAnim(src,false)
					            vRP.giveInventoryItem(user_id,"dinheirosujo",2000)
							TriggerClientEvent("Notify",src,"sucesso","Você vendeu <b>PSP Roubado</b>.")
					            inProgress[src] = false
							TriggerClientEvent("F6Cancel",src,false)
						end)
					end
				else
				TriggerClientEvent("Notify",src,"negado","Você não tem <b>PSP Roubado</b> na mochila.")
			end
		else
		TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
	end

	-- DEVENVOLVIDO  BY  PH NEVES
						
            elseif item == "cr" then
	            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dinheirosujo") <= vRP.getInventoryMaxWeight(user_id) then
		            if vRP.getInventoryItemAmount(user_id,"celularoubado") >= 1 then
			            if vRP.tryGetInventoryItem(user_id,"celularoubado",1) then
				            TriggerClientEvent("progress",src,1000,"fazendo")
							    vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							    inProgress[src] = true
				            TriggerClientEvent("F6Cancel",src,true)
				            SetTimeout(2000,function()
					            vRPclient._stopAnim(src,false)
					            vRP.giveInventoryItem(user_id,"dinheirosujo",2500)
							TriggerClientEvent("Notify",src,"sucesso","Você vendeu <b>Celular Roubado</b>.")
					            inProgress[src] = false
							TriggerClientEvent("F6Cancel",src,false)
						end)
					end
				else
				TriggerClientEvent("Notify",src,"negado","Você não tem <b>Celular Roubado</b> na mochila.")
			end
		else
		TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
	end

	-- DEVENVOLVIDO  BY  PH NEVES
						
            elseif item == "ct" then
	            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dinheirosujo") <= vRP.getInventoryMaxWeight(user_id) then
		            if vRP.getInventoryItemAmount(user_id,"cartaoroubado") >= 1 then
			            if vRP.tryGetInventoryItem(user_id,"cartaoroubado",1) then
				            TriggerClientEvent("progress",src,1000,"fazendo")
							    vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							    inProgress[src] = true
				            TriggerClientEvent("F6Cancel",src,true)
				            SetTimeout(2000,function()
					            vRPclient._stopAnim(src,false)
					            vRP.giveInventoryItem(user_id,"dinheirosujo",4000)
							TriggerClientEvent("Notify",src,"sucesso","Você vendeu <b>Cartão Roubado</b>.")
					            inProgress[src] = false
							TriggerClientEvent("F6Cancel",src,false)
						end)
					end
				else
				TriggerClientEvent("Notify",src,"negado","Você não tem <b>Cartão Roubado</b> na mochila.")
			end
		else
		TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
	end

	-- DEVENVOLVIDO  BY  PH NEVES
						
            elseif item == "sm" then
	            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dinheirosujo") <= vRP.getInventoryMaxWeight(user_id) then
		            if vRP.getInventoryItemAmount(user_id,"somroubado") >= 1 then
			            if vRP.tryGetInventoryItem(user_id,"somroubado",1) then
				            TriggerClientEvent("progress",src,1000,"fazendo")
							    vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							    inProgress[src] = true
				            TriggerClientEvent("F6Cancel",src,true)
				            SetTimeout(2000,function()
					            vRPclient._stopAnim(src,false)
					            vRP.giveInventoryItem(user_id,"dinheirosujo",4700)
							TriggerClientEvent("Notify",src,"sucesso","Você vendeu <b>Som Roubado</b>.")
					            inProgress[src] = false
							TriggerClientEvent("F6Cancel",src,false)
						end)
					end
				else
				TriggerClientEvent("Notify",src,"negado","Você não tem <b>Som Roubado</b> na mochila.")
			end
		else
		TriggerClientEvent("Notify",src,"negado","Você não tem espaço o suficiente.")
	end

	-- DEVENVOLVIDO  BY  PH NEVES

					elseif item == "cg" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dinheirosujo") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"cartaogroubado") >= 1 then
								if vRP.tryGetInventoryItem(user_id,"cartaogroubado",1) then
									TriggerClientEvent("progress",src,1000,"fazendo")
										vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
										inProgress[src] = true
									TriggerClientEvent("F6Cancel",src,true)
									SetTimeout(2000,function()
										vRPclient._stopAnim(src,false)
										vRP.giveInventoryItem(user_id,"dinheirosujo",4700)
									TriggerClientEvent("Notify",src,"sucesso","Você vendeu <b>Cartão Gold</b>.")
										inProgress[src] = false
									TriggerClientEvent("F6Cancel",src,false)
								end)
							end
						else
						TriggerClientEvent("Notify",src,"negado","Você não tem <b>Cartão Gold</b> na mochila.")
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
	if vRP.hasPermission(user_id,"bloods.permissao") then
		return true
	end
end