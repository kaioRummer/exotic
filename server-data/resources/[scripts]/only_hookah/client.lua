ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local shisha = {4037417364}
local shishaHasStarted = false
local distX, distY, distZ = 0, 0, 0
local buyad = false
local sessionStarted = false
local endCallback = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            for i = 1, #shisha do
                local closestShisha = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, shisha[i], false, false, false)
                local shishaPos = GetEntityCoords(closestShisha)
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, shishaPos.x, shishaPos.y, shishaPos.z, true)

                if dist < 3.5 then
					
					if not buyad then
						DrawText3Ds(shishaPos.x, shishaPos.y, shishaPos.z+1, "Press [~y~E~w~] to start a session. (20$)", 0.7)
					end

						-- Start Session
						if not sessionStarted then
                    if IsControlJustReleased(0, 38) then
						buyad = true
						sessionStarted = true
					    endCallback = true
						TriggerEvent("Notify","sucesso","~g~You've started a session and paid ~r~20$.") 

						ShishaFunctions()
						TriggerEvent("shisha:anim")
						
						
							local playerPed  = GetPlayerPed(-1)
							local coords     = GetEntityCoords(playerPed)
							local boneIndex  = GetPedBoneIndex(playerPed, 12844)
							local boneIndex2 = GetPedBoneIndex(playerPed, 24818)

	
							schlauch = CreateObject(GetHashKey("v_corp_lngestoolfd"),coords.x+0.5,coords.y+0.1,coords.z-0.4,false,false,false)
							AttachEntityToEntity(schlauch, playerPed, boneIndex2, -0.43, 0.68, 0.18, 0.0, 90.0, 90.0, true, true, false, true, 1, true)
							hookaschlauch = schlauch
							helmet = true
						
						TriggerServerEvent("shisha:pay")
						Citizen.CreateThread(function()
							while true do
								if sessionStarted == true then
									DrawText3Ds(shishaPos.x, shishaPos.y, shishaPos.z+0.4, "~c~Press ~b~\"H\"~c~ to pull the tube.", 0.7)
									DrawText3Ds(shishaPos.x, shishaPos.y, shishaPos.z, "~c~Press ~b~\"F\"~c~ to end the session.", 0.7)

								end
								Citizen.Wait(0)
							end
						end)
                    end
					end
                else
                    Citizen.Wait(500)
                end
            end
    end
end)

function ShishaFunctions()
Citizen.CreateThread(function()
    while true do
	local ped = GetPlayerPed(-1)
        Citizen.Wait(0)
        if IsControlJustPressed(0, 74) then -- Normal: H
			TriggerServerEvent("eff_smokes", PedToNet(ped))
        end
		
		if IsControlJustReleased(0, 23) then -- Normal: F
			if endCallback == true then
				sessionStarted = false
				buyad = false
				DeleteEntity(hookaschlauch)
				TriggerEvent("Notify","sucesso","Sessão acabou.") 
				endCallback = false
			end
		end
    end
end)
end

AddEventHandler("shisha:anim", function(source)
	local ped = GetPlayerPed(-1)
	local ad = "anim@heists@humane_labs@finale@keycards"
	local anim = "ped_a_enter_loop"
	while (not HasAnimDictLoaded(ad)) do
		RequestAnimDict(ad)
	  Wait(1)
	end
	TaskPlayAnim(ped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)
end)

p_smoke_location = {
	20279,
}
 
RegisterNetEvent("c_eff_smokes")
AddEventHandler("c_eff_smokes", function(c_ped)

	local c_ped = GetPlayerPed(-1)
	p_smoke_particle = "exp_grd_bzgas_smoke"
	p_smoke_particle_asset = "core" 
		for _,bones in pairs(p_smoke_location) do

			createdSmoke = UseParticleFxAssetNextCall(p_smoke_particle_asset)
			createdPart = StartParticleFxLoopedOnEntityBone(p_smoke_particle, c_ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(c_ped, bones), 5.0, 0.0, 0.0, 0.0)
			while DoesParticleFxLoopedExist(createdSmoke) do
				StopParticleFxLooped(createdSmoke, 1)
			  Wait(0)
			end
			
			while DoesParticleFxLoopedExist(p_smoke_particle) do
				StopParticleFxLooped(p_smoke_particle, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist(p_smoke_particle_asset) do
				StopParticleFxLooped(p_smoke_particle_asset, 1)
			  Wait(0)
			end
			Citizen.Wait(4000)
			RemoveParticleFxFromEntity(c_ped)
			break
		end
end)

RegisterNetEvent("only_hooka:delete")
AddEventHandler("only_hooka:delete", function(source)



	for i = 1, #shisha do
		local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
		local closestShisha = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, shisha[i], false, false, false)
		local shishaPos = GetEntityCoords(closestShisha)
		local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, shishaPos.x, shishaPos.y, shishaPos.z, true)

		if dist < 3.5 then
			local loc = vector3(shishaPos.x, shishaPos.y, shishaPos.z)
			
			DeleteEntity(closestShisha)
			TriggerEvent("Notify","sucesso","~g~The hookah was taken down.") 

		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent("only_hooka:spawn")
AddEventHandler("only_hooka:spawn", function(source)
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	prop = CreateObject(GetHashKey("prop_bong_01"),coords.x+0.5,coords.y+0.1,coords.z-0.7,false,false,false)
	FreezeEntityPosition(prop,true)

end)

function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/450
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end