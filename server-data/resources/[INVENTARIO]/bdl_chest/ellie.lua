local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONEXÃO ]-----------------------------------------------------------------------------------------------------------------------------------------------------------

src = {}
Tunnel.bindInterface("bdl_chest",src)
vCLIENT = Tunnel.getInterface("bdl_chest")

--[ VARIAVEIS ]---------------------------------------------------------------------------------------------------------------------------------------------------------

local wlogTDT = "https://canary.discord.com/api/webhooks/881261075293691926/Odj2baiPxzU5Ov5UKv84kuu6XTKff4KrXXA2kNjacCU_g37Gd8EqSMvdkn_Ltlg1GjZR"
local wlogTDB = "https://canary.discord.com/api/webhooks/881262680546086913/8UhAQc3aWtwDgsPJirtQO2nN6ExgseKKhkMM_SPj4860RnlGfrtmL4N-tXmmyIuXyzvL"
local wlogTDJ = "https://canary.discord.com/api/webhooks/881048065560162335/uWYWbW0x7wc4vvpvPT7hUVnkfopCBx2Fud_K8lymGOJ6FHXxi3Xk157y745xvBbZ_N2t"
local wlogTDF = "https://canary.discord.com/api/webhooks/881269416443138158/E9s6IsOYmvfcWjf9DtLbwGFHrgMGOSDJ3OrIPGAV33tf2q1ZMQSp5H3OP5M5qFPNSnW_"
local wlogMafia = "https://canary.discord.com/api/webhooks/881270357284229131/Mut0dxUZ4JRpNO29Z2ym_totIJH5ZPh96wZWw59FyQubBY9kFWd-SJm9pKbtXpidJPRH"
local wlogCartel = "https://canary.discord.com/api/webhooks/881272127066636298/kXvxhQNgVrWsD9H5m70Fgfa6uXZX7YjugHVDIRkh77-uxE-D_pIjbyiDG5OlDorpNXrO"
local wlogVanilla = "https://canary.discord.com/api/webhooks/881273645341741106/IIfIMjHPAEp8ULlMMXu5ZztIS61SiIAiEmOKRx6Abd29-rbFUnUeT-hP1aec9bwU-Oai"
local wlogBennys = "https://canary.discord.com/api/webhooks/881274291889512448/RCr4_faY2yI0Zz-fhu56UScagt0URwoO3oTzXKbHQUr3zEYJYsnWAQWY8u73AAKr__H-"
local wlogDpnorte = "https://canary.discord.com/api/webhooks/881275244826992662/nDWi1y37hWNEMWuokfZiJkmJizRlSelb7o1HIoXmIZ4UsTtPM-qE8ZxvQIxVSqs5GKrB"

--[ CHEST ]-------------------------------------------------------------------------------------------------------------------------------------------------------------

local chest = {

	["America"] = { 50000,"America.permissao" },
	["LiderAmerica"] = { 20000,"liderAmerica.permissao" },
	
	["Mafia"] = { 500000,"mafia.permissao" },
	["LiderMafia"] = { 20000,"lidermafia.permissao" },

	["Correia"] = { 50000,"Correia.permissao" },
	["LiderCorreia"] = { 20000,"liderCorreia.permissao" },

	["RufRuf"] = { 50000,"RufRuf.permissao" },
	["LiderRufRuf"] = { 20000,"liderRufRuf.permissao" },
	
	["Vinhedo"] = { 50000,"Vinhedo.permissao" },
	["LiderVinhedo"] = { 20000,"liderVinhedo.permissao" },

	["Bahamas"] = { 50000,"Bahamas.permissao" },
	["LiderBahamas"] = { 20000,"liderBahamas.permissao" },

	["Yakuza"] = { 50000,"Yakuza.permissao" },
	["LiderYakuza"] = { 20000,"liderYakuza.permissao" },

	["Bratva"] = { 50000,"Bratva.permissao" },
	["LiderBratva"] = { 20000,"liderBratva.permissao" },

	["Grota"] = { 50000,"Grota.permissao" },
	["LiderGrota"] = { 20000,"liderGrota.permissao" },

	["Fazenda"] = { 50000,"Fazenda.permissao" },
	["LiderFazenda"] = { 20000,"liderFazenda.permissao" },

	["Vanilla"] = { 50000,"Vanilla.permissao" },
	["LiderVanilla"] = { 20000,"liderVanilla.permissao" },

	["MotoClube"] = { 50000,"MotoClube.permissao" },
	["LiderMotoClube"] = { 20000,"liderMotoClube.permissao" },

    ["TequiLaLa"] = { 50000,"TequiLaLa.permissao" },
	["LiderTequiLaLa"] = { 20000,"liderTequiLaLa.permissao" },

	["Colombia"] = { 50000,"Colombia.permissao" },
	["LiderColombia"] = { 20000,"liderColombia.permissao" },

	["America"] = { 50000,"America.permissao" },
	["LiderAmerica"] = { 20000,"liderAmerica.permissao" },


	["LiderBennys"] = { 50000,"liderBennys.permissao" },

	["PMESP2Paycheck"] = { 50000,"pmesp.permissao" },
	["PC1Paycheck"] = { 50000,"PC.permissao" },
	["EnfermeiroHP"] = { 50000,"paramedico.permissao" },
	["mecanico"] = { 20000,"mecanico.permissao" }, -------------"pmesp.permissao",

	

	["PRF1Paycheck"] = { 20000,"policia.permissao" },
	
	["cartel"] = { 20000,"Cartel.permissao" },
	["vanilla"] = { 20000,"Vanilla.permissao" },
	["bennys"] = { 20000,"Bennys.permissao" },
}

--[ VARIÁVEIS ]---------------------------------------------------------------------------------------------------------------------------------------------------------

local actived = {}

--[ ACTIVEDOWNTIME ]----------------------------------------------------------------------------------------------------------------------------------------------------

local actived = {}
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(actived) do
			if actived[k] > 0 then
				actived[k] = v - 1
				if actived[k] <= 0 then
					actived[k] = nil
				end
			end
		end
		Citizen.Wait(100)
	end
end)

--[ CHECKINTPERMISSIONS ]-----------------------------------------------------------------------------------------------------------------------------------------------

function src.checkIntPermissions(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.searchReturn(source,user_id) then
			if vRP.hasPermission(user_id,"staff.permission") then
				return true
			end

			if vRP.hasPermission(user_id,chest[chestName][2]) then
				return true
			end
		end
	end
	return false
end

--[ OPENCHEST ]---------------------------------------------------------------------------------------------------------------------------------------------------------

function src.openChest(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local hsinventory = {}
		local myinventory = {}
		local data = vRP.getSData("chest:"..tostring(chestName))
		local result = json.decode(data) or {}
		if result then
			for k,v in pairs(result) do
				if vRP.itemBodyList(k) then
					table.insert(hsinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
				end
			end

			local inv = vRP.getInventory(parseInt(user_id))
			for k,v in pairs(inv) do
				if vRP.itemBodyList(k) then
					table.insert(myinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
				end
			end
		end
		return hsinventory,myinventory,vRP.getInventoryWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeItemsWeight(result),parseInt(chest[tostring(chestName)][1])
	end
	return false
end

--[ STOREITEM ]---------------------------------------------------------------------------------------------------------------------------------------------------------

function src.storeItem(chestName,itemName,amount)
    if itemName then
        local source = source
        local user_id = vRP.getUserId(source)
        if user_id then
			if vRP.storeChestItem(user_id,"chest:"..tostring(chestName),itemName,amount,chest[tostring(chestName)][1]) then
				local identity = vRP.getUserIdentity(user_id)
				if identity then
					if chestName == "TDT" then
						PerformHttpRequest(wlogTDT, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 4360181 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "TDB" then
						PerformHttpRequest(wlogTDB, function(err, text, headers) end, 'POST', json.encode({embeds = {{ title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"),icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 16399934 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "TDJ" then
						PerformHttpRequest(wlogTDJ, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 16757504 }}}), { ['Content-Type'] = 'application/json' })	
					elseif chestName == "TDF" then
						PerformHttpRequest(wlogTDF, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })	
					elseif chestName == "mafia" then
						PerformHttpRequest(wlogMafia, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })	
					elseif chestName == "cartel" then
						PerformHttpRequest(wlogCartel, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })	
					elseif chestName == "vanilla" then
						PerformHttpRequest(wlogvanilla, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })	
					elseif chestName == "bennys" then
						PerformHttpRequest(wlogbennys, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })	
					elseif chestName == "dpnorte" then
						PerformHttpRequest(wlogdpnorte, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM GUARDOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM GUARDADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })	
					end
				end
				TriggerClientEvent("Chest:UpdateChest",source,"updateChest")
			else
				TriggerClientEvent("Notify",source,"negado","Quantidade inválida e/ou baú cheio.",10000)
            end
        end
    end
end

--[ TAKEITEM ]----------------------------------------------------------------------------------------------------------------------------------------------------------

function src.takeItem(chestName,itemName,amount)
    if itemName then
        local source = source
        local user_id = vRP.getUserId(source)
        if user_id then
			if vRP.tryChestItem(user_id,"chest:"..tostring(chestName),itemName,amount) then
				local identity = vRP.getUserIdentity(user_id)
				if identity then
					if chestName == "TDT" then
						PerformHttpRequest(wlogTDT, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 4360181 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "TDB" then
						PerformHttpRequest(wlogTDB, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 16399934 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "TDJ" then
						PerformHttpRequest(wlogTDJ, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 16757504 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "TDF" then
						PerformHttpRequest(wlogTDF, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "mafia" then
						PerformHttpRequest(wlogMafia, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "cartel" then
						PerformHttpRequest(wlogCartel, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "vanilla" then
						PerformHttpRequest(wlogVanilla, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "bennys" then
						PerformHttpRequest(wlogBennys, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })
					elseif chestName == "dpnorte" then
						PerformHttpRequest(wlogDpnorte, function(err, text, headers) end, 'POST', json.encode({embeds = {{ 	title = "REGISTRO DE BAÚ:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",thumbnail = {url = "https://i.imgur.com/t9XzWqE.png"}, fields = {{ name = "**QUEM RETIROU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"},{ name = "**ITEM RETIRADO:**", value = "[ **Item: "..vRP.itemNameList(itemName).."** ][ **Quantidade: "..parseInt(amount).."** ]\n⠀⠀"}}, footer = {text = "BruxoCommunity - "..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = "https://i.imgur.com/t9XzWqE.png" },color = 7462510 }}}), { ['Content-Type'] = 'application/json' })
					end
				end
				TriggerClientEvent("Chest:UpdateChest",source,"updateChest")
			else
				TriggerClientEvent("Notify",source,"negado","Quantidade inválida e/ou inventário cheio.",10000)
            end
        end
    end
end