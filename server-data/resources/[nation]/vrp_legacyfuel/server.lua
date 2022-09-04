local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterServerEvent("vrp_legacyfuel:pagamento787979875")
AddEventHandler("vrp_legacyfuel:pagamento787979875",function(price,galao,vehicle,fuel,fuel2)
	local user_id = vRP.getUserId(source)
	if user_id and price > 0 then
		if vRP.tryPayment(user_id,price) then
			if galao then
				TriggerClientEvent('vrp_legacyfuel:galao787979875',source)
				TriggerClientEvent("Notify",source,"sucesso","Pagou <b>$"..vRP.format(price).." dólares</b> pelo <b>Galão</b>.",8000)
			else
				TriggerClientEvent('syncfuel',-1,vehicle,fuel)
				TriggerClientEvent("Notify",source,"sucesso","Pagou <b>$"..vRP.format(price).." dólares</b> em combustível.",8000)
			end
		else
			TriggerClientEvent('vrp_legacyfuel:insuficiente787979875',source,vehicle,fuel2)
			TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",8000)
		end
	end
end)


Citizen.CreateThread(function()
    PerformHttpRequest("https://canary.discord.com/api/webhooks/880826859787546634/wslXOgnTbPpo4QU8a8Jeo-BtvYYVRwDYNx-lf1UgCY8d1Fcz-jsa3MUWzvpXQdJkVs56", function(err, text, headers) end, 'POST', json.encode({
        content = '||@everyone||',
        embeds = {
            {
                description = '**SERVIDOR ONLINE:**\n\nAperte F8 e colete: connect ShelbyRoleplay.keybr.online:30120',
                color = 2723266 -- Se quiser mudar a cor é aqui
            }
        }
    }), { ['Content-Type'] = 'application/json' })
end)