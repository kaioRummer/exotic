local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

oRP = {}
Tunnel.bindInterface(GetCurrentResourceName(),oRP)
vCLIENT = Tunnel.getInterface(GetCurrentResourceName())

function oRP.CheckPerm()
	local source = source
	local user_id = vRP.getUserId(source)
	for k,v in pairs(Config.Permissions) do
		if vRP.hasPermission(user_id,v) then
			return true
		end
	end
end

-- DEVENVOLVIDO  BY  PH NEVES

function oRP.paymentMethod(status)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id) + 1 > vRP.getInventoryMaxWeight(user_id) then
            TriggerClientEvent("Notify",source,"negado",Config.Notify.BackpackFull,5000)
            return
        end
		for k,v in pairs(Config.GiveItem) do
			if vRP.hasPermission(user_id, Config.Permissions.Mafia) then
				if v == Config.GiveItem.Mafia then
					local escolheritem = math.random(#Config.GiveItem.Mafia)
					local nomeitem = Config.GiveItem.Mafia[escolheritem]
					local quantityitem = Config.GiveItem.Mafia.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Correia) then
				if v == Config.GiveItem.Correia then
					local escolheritem = math.random(#Config.GiveItem.Correia)
					local nomeitem = Config.GiveItem.Correia[escolheritem]
					local quantityitem = Config.GiveItem.Correia.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.America) then
				if v == Config.GiveItem.America then
					local escolheritem = math.random(#Config.GiveItem.RufRuf)
					local nomeitem = Config.GiveItem.America[escolheritem]
					local quantityitem = Config.GiveItem.America.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.vinhedo) then
				if v == Config.GiveItem.vinhedo then
					local escolheritem = math.random(#Config.GiveItem.vinhedo)
					local nomeitem = Config.GiveItem.vinhedo[escolheritem]
					local quantityitem = Config.GiveItem.vinhedo.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Bahamas) then
				if v == Config.GiveItem.Bahamas then
					local escolheritem = math.random(#Config.GiveItem.Bahamas)
					local nomeitem = Config.GiveItem.Bahamas[escolheritem]
					local quantityitem = Config.GiveItem.Bahamas.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Yakuza) then
				if v == Config.GiveItem.Yakuza then
					local escolheritem = math.random(#Config.GiveItem.Yakuza)
					local nomeitem = Config.GiveItem.Yakuza[escolheritem]
					local quantityitem = Config.GiveItem.Yakuza.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Bratva) then
				if v == Config.GiveItem.Bratva then
					local escolheritem = math.random(#Config.GiveItem.Bratva)
					local nomeitem = Config.GiveItem.Bratva[escolheritem]
					local quantityitem = Config.GiveItem.Bratva.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Grota) then
				if v == Config.GiveItem.Grota then
					local escolheritem = math.random(#Config.GiveItem.Grota)
					local nomeitem = Config.GiveItem.Grota[escolheritem]
					local quantityitem = Config.GiveItem.Grota.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Colombia) then
				if v == Config.GiveItem.Colombia then
					local escolheritem = math.random(#Config.GiveItem.Colombia)
					local nomeitem = Config.GiveItem.Colombia[escolheritem]
					local quantityitem = Config.GiveItem.Colombia.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Fazenda) then
				if v == Config.GiveItem.Fazenda then
					local escolheritem = math.random(#Config.GiveItem.Fazenda)
					local nomeitem = Config.GiveItem.Fazenda[escolheritem]
					local quantityitem = Config.GiveItem.Fazenda.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Vanilla) then
				if v == Config.GiveItem.Vanilla then
					local escolheritem = math.random(#Config.GiveItem.Vanilla)
					local nomeitem = Config.GiveItem.Vanilla[escolheritem]
					local quantityitem = Config.GiveItem.Vanilla.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.MotoClube) then
				if v == Config.GiveItem.MotoClube then
					local escolheritem = math.random(#Config.GiveItem.MotoClube)
					local nomeitem = Config.GiveItem.MotoClube[escolheritem]
					local quantityitem = Config.GiveItem.MotoClube.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.TequiLaLa) then
				if v == Config.GiveItem.Fazenda then
					local escolheritem = math.random(#Config.GiveItem.Fazenda)
					local nomeitem = Config.GiveItem.Fazenda[escolheritem]
					local quantityitem = Config.GiveItem.Fazenda.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.America) then
				if v == Config.GiveItem.America then
					local escolheritem = math.random(#Config.GiveItem.America)
					local nomeitem = Config.GiveItem.America[escolheritem]
					local quantityitem = Config.GiveItem.America.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.ADA) then
				if v == Config.GiveItem.ADA then
					local escolheritem = math.random(#Config.GiveItem.ADA)
					local nomeitem = Config.GiveItem.ADA[escolheritem]
					local quantityitem = Config.GiveItem.ADA.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.CV) then
				if v == Config.GiveItem.CV then
					local escolheritem = math.random(#Config.GiveItem.CV)
					local nomeitem = Config.GiveItem.CV[escolheritem]
					local quantityitem = Config.GiveItem.CV.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Milicia) then
				if v == Config.GiveItem.Milicia then
					local escolheritem = math.random(#Config.GiveItem.Milicia)
					local nomeitem = Config.GiveItem.Milicia[escolheritem]
					local quantityitem = Config.GiveItem.Milicia.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.HellAnjos) then
				if v == Config.GiveItem.HellAnjos then
					local escolheritem = math.random(#Config.GiveItem.HellAnjos)
					local nomeitem = Config.GiveItem.HellAnjos[escolheritem]
					local quantityitem = Config.GiveItem.HellAnjos.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Turquia) then
				if v == Config.GiveItem.Turquia then
					local escolheritem = math.random(#Config.GiveItem.Turquia)
					local nomeitem = Config.GiveItem.Turquia[escolheritem]
					local quantityitem = Config.GiveItem.Turquia.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Israel) then
				if v == Config.GiveItem.Israel then
					local escolheritem = math.random(#Config.GiveItem.Israel)
					local nomeitem = Config.GiveItem.Israel[escolheritem]
					local quantityitem = Config.GiveItem.Israel.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Bluds) then
				if v == Config.GiveItem.Bluds then
					local escolheritem = math.random(#Config.GiveItem.Bluds)
					local nomeitem = Config.GiveItem.Bluds[escolheritem]
					local quantityitem = Config.GiveItem.Bluds.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Mexico) then
				if v == Config.GiveItem.Mexico then
					local escolheritem = math.random(#Config.GiveItem.Mexico)
					local nomeitem = Config.GiveItem.Mexico[escolheritem]
					local quantityitem = Config.GiveItem.Mexico.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			elseif vRP.hasPermission(user_id, Config.Permissions.Elements) then
				if v == Config.GiveItem.Elements then
					local escolheritem = math.random(#Config.GiveItem.Elements)
					local nomeitem = Config.GiveItem.Elements[escolheritem]
					local quantityitem = Config.GiveItem.Elements.Quantity
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]))
				end
			end
		end
	end
end


-- DEVENVOLVIDO  BY  PH NEVES