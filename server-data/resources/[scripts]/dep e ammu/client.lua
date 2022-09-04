local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("thzin_loja",src)
vSERVER = Tunnel.getInterface("thzin_loja")
---------------------------------------------------------------------------------------------------------------------------------------
-- COMMAND
---------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			for _,mark in pairs(config.Coords) do
			local x,y,z = table.unpack(mark)

				local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
				if distance <= 1 then
					timeDistance = 4
					DrawText3D(x,y,z+0.1,"~g~E~w~  ABRIR")

					if IsControlJustPressed(1,38) then
						local carteira,banco,nome,sobrenome = vSERVER.getinfo()
						SetNuiFocus(true,true)
						SendNUIMessage({ departamento = true, nome = nome, sobrenome = sobrenome,carteira = carteira, banco = banco})
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------
-- COMMAND
---------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			for _,mark in pairs(config.Coords2) do
			local x,y,z = table.unpack(mark)

				local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
				if distance <= 1 then
					timeDistance = 4
					DrawText3D(x,y,z+0.1,"~g~E~w~  ABRIR")

					if IsControlJustPressed(1,38) then
						local carteira,banco,nome,sobrenome = vSERVER.getinfo()
						SetNuiFocus(true,true)
						SendNUIMessage({ ammunation = true, nome = nome, sobrenome = sobrenome,carteira = carteira, banco = banco})
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE NUI IN ESC
---------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)
---------------------------------------------------------------------------------------------------------------------------------------
-- BUY ITENS
---------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('buy', function(data, cb)
    if data.price then
		vSERVER.getItens(data.item, data.price, data.name)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	SetTextFont(4)
	SetTextCentre(1)
	SetTextEntry("STRING")
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z,0)
	DrawText(0.0,0.0)
	local factor = (string.len(text) / 450) + 0.01
	DrawRect(0.0,0.0125,factor,0.03,40,36,52,240)
	ClearDrawOrigin()
end