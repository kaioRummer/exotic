local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "gas-01" then
		spawnVehicle("tanker2",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Combustível</b> liberada.")
	elseif data == "gas-02" then
		spawnVehicle("tanker2",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Combustível</b> liberada.")
	elseif data == "gas-03" then
		spawnVehicle("tanker2",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Combustível</b> liberada.")

	elseif data == "diesel-01" then
		spawnVehicle("armytanker",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Diesel</b> liberada.")
	elseif data == "diesel-02" then
		spawnVehicle("armytanker",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Diesel</b> liberada.")
	elseif data == "diesel-03" then
		spawnVehicle("armytanker",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Diesel</b> liberada.")

	elseif data == "show-01" then
		spawnVehicle("tvtrailer",742.05, -1354.85, 26.34)
		TriggerEvent("Notify","sucesso","Carga de <b>Shows</b> liberada \n Retire o caminhão ao lado.")
	elseif data == "show-02" then
		spawnVehicle("tvtrailer",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Shows</b> liberada.")
	elseif data == "show-03" then
		spawnVehicle("tvtrailer",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Shows</b> liberada.")

	elseif data == "woods-01" then
		spawnVehicle("trailerlogs",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Madeiras</b> liberada.")
	elseif data == "woods-02" then
		spawnVehicle("trailerlogs",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Madeiras</b> liberada.")
	elseif data == "woods-03" then
		spawnVehicle("trailerlogs",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Madeiras</b> liberada.")

	elseif data == "cars-01" then
		spawnVehicle("tr4",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Veículos</b> liberada.")
	elseif data == "cars-02" then
		spawnVehicle("tr4",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Veículos</b> liberada.")
	elseif data == "cars-03" then
		spawnVehicle("tr4",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Veículos</b> liberada.")

	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)

function spawnVehicle(name,x,y,z)
	local mhash = GetHashKey(name)
	while not HasModelLoaded(mhash) do
		RequestModel(mhash)
		Citizen.Wait(10)
	end

	if HasModelLoaded(mhash) then
		local nveh = CreateVehicle(mhash,x,y,z+0.5,270.90,true,false)

		SetVehicleOnGroundProperly(nveh)
		SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
		SetEntityAsMissionEntity(nveh,true,true)

		SetModelAsNoLongerNeeded(mhash)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),758.11, -1332.42, 27.28,true)
		if distance <= 1.2 then
			if IsControlJustPressed(0,38) then
				ToggleActionMenu()
			end
		end
	end
end)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                      -- Texto3D --
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--[[
~r~ = Red
~b~ = Blue
~g~ = Green
~y~ = Yellow
~p~ = Purple
~o~ = Orange
~c~ = Grey?
~m~ = Darker Grey
~u~ = Black
~n~ = New Line
~s~ = Default White
~h~ = Bold Text
]]
local TeleportFromTo = {
	["texto_localonibus"] = {
		positionFrom = { ['x'] = 758.11, ['y'] = -1332.42, ['z'] = 27.28, nom = ""},  
		positionTo = {  ['x'] = 758.11, ['y'] = -1332.42, ['z'] = 27.28,nom = "~b~Pressione E para retirar a Carga \n ~y~/carga caminhao~y~ \n ~b~Para começar a rota"},
	},
}

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing


function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function Drawing.drawMissionText(m_text, showtime)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(m_text)
    DrawSubtitleTimed(showtime, 1)
end

function msginf(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k, j in pairs(TeleportFromTo) do

			--msginf(k .. " " .. tostring(j.positionFrom.x), 15000)
			if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 150.0)then
				DrawMarker(100, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255,255, 0, 0, 0,0)
				if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 5.0)then
					Drawing.draw3DText(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1.100, j.positionFrom.nom, 1, 0.2, 0.1, 255, 255, 255, 215)
					if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 2.0)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("".. j.positionFrom.nom)
						DrawSubtitleTimed(2000, 1)
					end
				end
			end

			if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 150.0)then
				DrawMarker(100, j.positionTo.x, j.positionTo.y, j.positionTo.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255,255, 0, 0, 0,0)
				if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 5.0)then
					Drawing.draw3DText(j.positionTo.x, j.positionTo.y, j.positionTo.z - 1.100, j.positionTo.nom, 1, 0.2, 0.1, 255, 255, 255, 215)
					if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 2.0)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("".. j.positionTo.nom)
						DrawSubtitleTimed(2000, 1)
					end
				end
			end
		end
	end
end)