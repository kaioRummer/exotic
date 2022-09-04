local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
inProgress = {}

src = {}
Tunnel.bindInterface("ph_lavagem", src)

local itemName = {
	{ item = "lavar" },
	{ item = "bebida1" }
}

-- DEVENVOLVIDO  BY  PH NEVES

RegisterServerEvent("ph_lavagem:weaponfactory")
AddEventHandler("ph_lavagem:weaponfactory",function(item)
	local src = source
	local user_id = vRP.getUserId(src)
	local valor = vRP.prompt(source,"Quanto dinheiro você deseja lavar:","")
    local banco = vRP.getBankMoney(user_id)

	if user_id then
		for e,g in pairs(itemName) do
			if item == g.item then
				if not inProgress[src] then

					if item == "lavar" then
						if valor == "" then 
							return TriggerClientEvent("Notify",src,"negado","Você precisa colocar um valor para confirmar sua solicitação.")
					 	end			
						if vRP.getInventoryItemAmount(user_id,"notafiscalfalsa") >= 3 then
					    if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= parseInt(valor) then
					
							TriggerClientEvent("progress",src,10000,"LAVANDO DINHEIRO")
							TriggerClientEvent("lavagem-dinheiro:posicao",src)
							vRPclient._playAnim(src,false,{{"anim@heists@prison_heistig1_p1_guard_checks_bus","loop"}},true)

							vRP.tryGetInventoryItem(user_id,"dinheirosujo",parseInt(valor))
							vRP.tryGetInventoryItem(user_id,"notafiscalfalsa",3)

							vRP.giveInventoryItem(user_id,"cerveja",1)
							SetTimeout(10000,function()
								vRPclient._stopAnim(src,false)
								vRP.setBankMoney(user_id,banco+valor)
								TriggerClientEvent("Notify",src,"sucesso","Você lavou <b>$"..valor.."</b> reais.")
							end)
						else
							TriggerClientEvent("Notify",src,"negado","Você não tem <b>Dinheiro Sujo</b> suficiente na mochila.")
						end
					else
						TriggerClientEvent("Notify",src,"negado","Você não tem <b>Nota Físcal Falsa</b> suficiente na mochila.")
					end

					-- DEVENVOLVIDO  BY  PH NEVES
					
					elseif item == "lavagem" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("tablete") <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.getInventoryItemAmount(user_id,"maconha") >= 50 then
								if vRP.getInventoryItemAmount(user_id,"embalagem") >= 5 then
											if vRP.tryGetInventoryItem(user_id,"maconha",50) and vRP.tryGetInventoryItem(user_id,"embalagem",5) then
												TriggerClientEvent("progress",src,1000,"fazendo")
												vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
												inProgress[src] = true
												TriggerClientEvent("F6Cancel",src,true)
												SetTimeout(2000,function()
													vRPclient._stopAnim(src,false)
													vRP.giveInventoryItem(user_id,"tablete",50)
													TriggerClientEvent("Notify",src,"sucesso","Você fabricou um <b>50 Tablete</b>.")
													inProgress[src] = false
													TriggerClientEvent("F6Cancel",src,false)
												end)
											end
										else
											TriggerClientEvent("Notify",src,"negado","Você não tem <b>Maconha</b> o suficiente.")
										end
									else
										TriggerClientEvent("Notify",src,"negado","Você não tem <b>Embalagem</b> o suficiente.")
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
	if vRP.hasPermission(user_id,"vanilla.permissao") or vRP.hasPermission(user_id,"bahamas.permissao") then
		return true
	end
end