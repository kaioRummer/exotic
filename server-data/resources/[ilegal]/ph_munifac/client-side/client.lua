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
	
	if data == "fabricar-ahk" then
		TriggerServerEvent("ph_munifac:weaponfactory","ahk")

	elseif data == "fabricar-ahkk" then
		TriggerServerEvent("ph_munifac:weaponfactory","mmhk")

	elseif data == "fabricar-mfive" then
		TriggerServerEvent("ph_munifac:weaponfactory","mfive")

	elseif data == "fabricar-mfive" then
		TriggerServerEvent("ph_munifac:weaponfactory","mmfive")
		
	elseif data == "fabricar-mtec9" then
		TriggerServerEvent("ph_munifac:weaponfactory","mtec9")

	elseif data == "fabricar-mmtec9" then
		TriggerServerEvent("ph_munifac:weaponfactory","mmtec9")
		
	elseif data == "fabricar-muzi" then
		TriggerServerEvent("ph_munifac:weaponfactory","muzi")

	elseif data == "fabricar-mmuzi" then
		TriggerServerEvent("ph_munifac:weaponfactory","mmuzi")
		
	elseif data == "fabricar-mfamas" then
		TriggerServerEvent("ph_munifac:weaponfactory","mfamas")

	elseif data == "fabricar-mmfamas" then
		TriggerServerEvent("ph_munifac:weaponfactory","mmfamas")
		
	elseif data == "fabricar-mak47" then
		TriggerServerEvent("ph_munifac:weaponfactory","mak47")

	elseif data == "fabricar-mak47" then
		TriggerServerEvent("ph_munifac:weaponfactory","mmak47")
		
	elseif data == "fabricar-makm" then
		TriggerServerEvent("ph_munifac:weaponfactory","makm")

	elseif data == "fabricar-mmakm" then
		TriggerServerEvent("ph_munifac:weaponfactory","mmakm")

	elseif data == "fabricar-mg36" then
		TriggerServerEvent("ph_munifac:weaponfactory","mg36")

	elseif data == "fabricar-mmg36" then
		TriggerServerEvent("ph_munifac:weaponfactory","mmg36")
		
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
	{ ['x'] = -1870.41, ['y'] = 2062.03, ['z'] = 135.44 }
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
				DrawText3D(factory.x,factory.y,factory.z,"Pressione [~w~E~w~] Para Fabricar Munições.")
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