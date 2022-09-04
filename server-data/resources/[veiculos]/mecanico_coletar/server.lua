local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("mecanico_coletar",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.terPemissao(user_id,"mecanico.permissao")
end

function emP.checkPayment()
	local source = source
   local user_id = vRP.getUserId(source)
   local quant1 = math.random(5)
   local quant2 = math.random(5)
   local quant3 = math.random(5)
   local quant5 = math.random(5)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("ferramentas") <= vRP.getInventoryMaxWeight(user_id) then
         vRP.giveInventoryItem(user_id,"ferramentas",quant1)
         vRP.giveInventoryItem(user_id,"estepe",quant2)
         vRP.giveInventoryItem(user_id,"vidro",quant3)
         vRP.giveInventoryItem(user_id,"macarico",quant5)
         TriggerClientEvent("Notify",source,"sucesso","<b>Você Recebeu "..quant1.."x Ferramentas</b>")
         TriggerClientEvent("Notify",source,"sucesso","<b>Você Recebeu "..quant2.."x Estepe</b>")
         TriggerClientEvent("Notify",source,"sucesso","<b>Você Recebeu "..quant3.."x Vidro</b>")
         TriggerClientEvent("Notify",source,"sucesso","<b>Você Recebeu "..quant5.."x Maçarico</b>")
         return true
      else
         TriggerClientEvent("Notify",source,"negado","<b>Inventário Cheio</b>.")
		end
	end
end
math.random(2)
