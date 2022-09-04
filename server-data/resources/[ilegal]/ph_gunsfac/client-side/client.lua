local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface("ph_munifac")

onmenu = false

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		TriggerEvent("ph:triggerhud")
		onmenu = true
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		TriggerEvent("ph:triggerhud")
		SetNuiFocus(false)
		onmenu = false
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end

-- DEVENVOLVIDO  BY  PH NEVES
-----------------------------------------------------------------------------------------------------------------------------------------
--[ BUTTON ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)

	if data == "fabricar-hk" then
		TriggerServerEvent("ph_gunsfac:weaponfactory","ahk")
		
	elseif data == "fabricar-five" then
		TriggerServerEvent("ph_gunsfac:weaponfactory","five")
		
	elseif data == "fabricar-tec9" then
		TriggerServerEvent("ph_gunsfac:weaponfactory","tec9")
		
	elseif data == "fabricar-uzi" then
		TriggerServerEvent("ph_gunsfac:weaponfactory","uzi")
		
	elseif data == "fabricar-famas" then
		TriggerServerEvent("ph_gunsfac:weaponfactory","famas")
		
	elseif data == "fabricar-ak47" then
		TriggerServerEvent("ph_gunsfac:weaponfactory","ak47")
		
	elseif data == "fabricar-akm" then
		TriggerServerEvent("ph_gunsfac:weaponfactory","akm")

	elseif data == "fabricar-g36" then
		TriggerServerEvent("ph_gunsfac:weaponfactory","g36")
		
	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)

-- DEVENVOLVIDO  BY  PH NEVES
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local factory = {
	{ ['x'] = -2365.98, ['y'] = 1744.28, ['z'] = 215.48 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MENU ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local idle = 1000

		for k,v in pairs(factory) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local distance = Vdist(v.x,v.y,v.z,x,y,z)
			local factory = factory[k]
			
			if distance <= 15 and not onmenu then
				idle = 5
				DrawMarker(27, factory.x, factory.y, factory.z-0.98,0,0,0,0.0,0,0,0.8,0.8,0.4,45,45,45,90,0,0,0,1)
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) then
						if vSERVER.checkPermission() then
							ToggleActionMenu()
						end
					end
				end
			end
			if distance <= 1.5 and not onmenu then
				idle = 5
				DrawText3D(factory.x,factory.y,factory.z,"Pressione [E] Para Fabricar Armas.")
			end
		end
		Citizen.Wait(idle)
	end
end)

-- DEVENVOLVIDO  BY  PH NEVES

-- [ FUNÇÃO DO TEXTO 3D ] --
function DrawText3D(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end