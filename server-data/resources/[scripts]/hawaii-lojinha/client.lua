local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
func = Tunnel.getInterface("hawaii-lojinha")

fclient = {}
Tunnel.bindInterface("hawaii-lojinha",fclient)

function toggleNui()
	nui = not nui
	if nui then
		TriggerScreenblurFadeIn(500)
		SetNuiFocus(true,true)
		SendNUIMessage({action = "show", items = func.getItems(), money = func.getMoney()})
	else
		TriggerScreenblurFadeOut(500)
		SetNuiFocus(false)
		SendNUIMessage({action = "hide"})
	end
end

Citizen.CreateThread(function()
	TriggerScreenblurFadeOut(500)
	SetNuiFocus(false)
	while true do
		local idle = 500
		if not ammunation then
			ammunation = getNearestAmmunation()
		elseif not nui then
			idle = 0
			DrawMarker(21,ammunation,0,0,0,0.0,0,0,0.5,0.5,0.4,255, 0, 0,50,1,1,0,0)
			if IsControlJustPressed(0,38) and GetEntityHealth(PlayerPedId()) > 101 then
				toggleNui()
			end
			local distance = #(GetEntityCoords(PlayerPedId()) - ammunation)
			if distance > 2 then
				ammunation = false
			end
		end
		Citizen.Wait(idle)
	end
end)

function getNearestAmmunation()
	local playercoords = GetEntityCoords(PlayerPedId())
	for i,j in ipairs(config.ammunations) do
		local distance = #(playercoords - j)
		if distance < 2 then
			return j
		end
	end
end


function notify(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


function fclient.updateMoney(money)
	SendNUIMessage({action = "updateMoney", money = money})
end

RegisterNUICallback("close", function(data)
	toggleNui()
end) 


RegisterNUICallback("comprar", function(data)
	if data and data.item and not block then
		setBlock()
		func.buyItem(data.item)
	end
end) 

function setBlock()
	block = true
	Citizen.CreateThread(function()
		local time = 3
		while time > 0 do
			Wait(1000)
			time = time - 1
		end
		block = false
	end)
end

