local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface("ph_desmanche")

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
-----------------------------------------------------------------------------------------------------------------------------------------
--[ BUTTON ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)

	if data == "fabricar-1" then
		TriggerServerEvent("ph_desmanche:weaponfactory","placa")
		
	elseif data == "fabricar-2" then
		TriggerServerEvent("ph_desmanche:weaponfactory","masterpick")
		
	elseif data == "fabricar-3" then
		TriggerServerEvent("ph_desmanche:weaponfactory","nitro")
		
	elseif data == "fabricar-4" then
		TriggerServerEvent("ph_desmanche:weaponfactory","lockpick")
		
	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local factory = {
	{ ['x'] = 1549.82, ['y'] = 3513.67, ['z'] = 36.0 },
	{ ['x'] = 988.34, ['y'] = -94.48, ['z'] = 74.85 }
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
				DrawText3D(factory.x,factory.y,factory.z,"Pressione [E] Para Fabricar Ilegal.")
			end
		end
		Citizen.Wait(idle)
	end
end)

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