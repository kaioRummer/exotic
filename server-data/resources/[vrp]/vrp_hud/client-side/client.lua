local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
src = {}
Tunnel.bindInterface(GetCurrentResourceName(),src)
Proxy.addInterface(GetCurrentResourceName(),src)
Serverr = Tunnel.getInterface(GetCurrentResourceName())

local hour = 0
local minute = 0
local showHud = true
local showRadar = false
local seatbelt = false

function TimeDisplay()
	hour = GetClockHours()
	month = GetClockMonth()
	minute = GetClockMinutes()
	dayMonth = GetClockDayOfMonth()
	if hour <= 9 then
		hour = "0"..hour
	end
	if minute <= 9 then
		minute = "0"..minute
	end
end

Citizen.CreateThread(function() 
	while true do
		local sleep = 1000
		if IsPauseMenuActive() or IsScreenFadedOut() then
			SendNUIMessage({ hud = false, movie = false })
		else
			local ped = PlayerPedId()
			local armour = GetPedArmour(ped)
			local health = (GetEntityHealth(GetPlayerPed(-1))-100) /300*100
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(x,y,z))
			local resourcename = GetCurrentResourceName()
			TimeDisplay()
			if not showHud or not IsPedInAnyVehicle(ped) then 
				showRadar = false 
				DisplayRadar(showRadar)
			end

			if not IsPedInAnyVehicle(ped) then
				sleep = 1000
				SendNUIMessage({ hud = showHud, car = false, hour = hour, minute = minute, street = street, health = parseInt(health), armour = parseInt(armour), resourcename = resourcename })
			else
				sleep = 200
				showRadar = true
				local vehicle = GetVehiclePedIsIn(ped)
				local fuel = GetVehicleFuelLevel(vehicle)
				local speed = GetEntitySpeed(vehicle) * 3.6
				local vehicle = GetVehiclePedIsUsing(ped)
				local engine = GetVehicleEngineHealth(vehicle)
				local gear = GetVehicleCurrentGear(vehicle)
                DisplayRadar(showRadar)
				SendNUIMessage({ hud = showHud, car = true, hour = hour, minute = minute, street = street, health = parseInt(health), armour = parseInt(armour), fuel = parseInt(fuel), speed = parseInt(speed), seatbelt = seatbelt, gear = gear, carheath = engine, resourcename = resourcename })
			end
		end
		Citizen.Wait(sleep)
	end
end)

function toggleSeatbelt()
	Citizen.CreateThread(function() 
		while seatbelt do
			Citizen.Wait(10)
			DisableControlAction(0,75)
		end
	end)
end
IsCar = function(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 15 and vc <= 20)
end

RegisterKeyMapping('hud:seatbelt', 'Cinto de segurança', 'keyboard', 'G')

RegisterCommand('hud:seatbelt', function() 
	local ped = PlayerPedId()
	local car = GetVehiclePedIsIn(ped)
	
	if car ~= 0 and (IsCar(car)) then
		if seatbelt then
			TriggerEvent("vrp_sound:source","unbelt",0.5)
			seatbelt = false
		else
			TriggerEvent("vrp_sound:source","belt",0.5)
			seatbelt = true
			toggleSeatbelt()
		end
	end
end, false)

RegisterCommand("hud",function(source,args)
	showHud = not showHud
	showRadar = not showRadar
end)

RegisterNUICallback("antidevtools", function(data, cb)
	Serverr.antidevtools()
end)