local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("thzin_loja",src)
vCLIENT = Tunnel.getInterface("thzin_loja")
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GIVE ITENS
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.getItens(item, price, name)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.tryFullPayment(user_id, parseInt(price)) then
	    vRP.giveInventoryItem(user_id, item, 1)
		TriggerClientEvent('Notify',source,'sucesso',"Você comprou um "..name.." com sucesso por "..vRP.format(price).. "dólares")
	else
		TriggerClientEvent('Notify',source,'negado',"Você não possui "..vRP.format(price).."dólares")
	end
end

function src.getinfo()
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local carteira = vRP.getMoney(user_id)
	local banco = vRP.getBankMoney(user_id)
	local identity = vRP.getUserIdentity(user_id)
	if identity then 
		return vRP.format(parseInt(carteira)),vRP.format(parseInt(banco)),identity.name,identity.fistname
	end
end