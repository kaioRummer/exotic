local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_hospital")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local macas = {
    { ['x'] = -805.94, ['y'] = -1229.61, ['z'] = 7.34, ['x2'] = -806.76, ['y2'] = -1229.09, ['z2'] = 8.26, ['h'] = 134.61 }, --- verificado
    { ['x'] = -803.41, ['y'] = -1232.01, ['z'] = 7.34, ['x2'] = -804.02, ['y2'] = -1231.09, ['z2'] = 8.26, ['h'] = 134.61 }, --- verificado
    { ['x'] = -800.6, ['y'] = -1233.93, ['z'] = 7.34, ['x2'] = -800.1, ['y2'] = -1234.69, ['z2'] = 8.26, ['h'] = 134.61 }, --- verificado
    { ['x'] = -808.73, ['y'] = -1227.25, ['z'] = 7.34, ['x2'] = -809.52, ['y2'] = -1226.77, ['z2'] = 8.26, ['h'] = 134.61 }, --- verificado
    { ['x'] = -811.51, ['y'] = -1225.03, ['z'] = 7.34, ['x2'] = -812.23, ['y2'] = -1224.49, ['z2'] = 8.26, ['h'] = 134.61 }, --- verificado
    { ['x'] = -808.66, ['y'] = -1221.56, ['z'] = 7.34, ['x2'] = -809.22, ['y2'] = -1220.88, ['z2'] = 8.26, ['h'] = 318.86 }, --- verificado
    { ['x'] = -804.83, ['y'] = -1224.58, ['z'] = 7.34, ['x2'] = -805.56, ['y2'] = -1224.11, ['z2'] = 8.26, ['h'] = 318.86 }, --- verificado
    { ['x'] = -801.79, ['y'] = -1227.26, ['z'] = 7.34, ['x2'] = -801.01, ['y2'] = -1227.84, ['z2'] = 8.26, ['h'] = 318.86 }, --- verificado
    { ['x'] = -798.0, ['y'] = -1230.63, ['z'] = 7.34, ['x2'] = -797.04, ['y2'] = -1231.05, ['z2'] = 8.26, ['h'] = 318.86 }, --- verificado
    { ['x'] = -798.01, ['y'] = -1230.66, ['z'] = 7.34, ['x2'] = -797.1, ['y2'] = -1231.16, ['z2'] = 8.26, ['h'] = 318.86 }, --- verificado
    { ['x'] = 439.20, ['y'] = -976.33, ['z'] = 26.66, ['x2'] = 438.37, ['y2'] = -976.05, ['z2'] = 27.58, ['h'] = -5.02 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEITANDO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ms = 1000
		for k,v in pairs(macas) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 1.1 then
				ms = 1
				drawTxt("~r~E~w~  DEITAR    ~g~G~w~  TRATAMENTO",4,0.5,0.93,0.50,255,255,255,180)
				if IsControlJustPressed(0,38) then
					SetEntityCoords(ped,v.x2,v.y2,v.z2)
					SetEntityHeading(ped,v.h)
					vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
				end
				if IsControlJustPressed(0,47) then
					if emP.checkServices() then
						TriggerEvent('tratamento-macas')
						TriggerEvent('resetDiagnostic')
						TriggerEvent('resetWarfarina')
						SetEntityCoords(ped,v.x2,v.y2,v.z2)
						SetEntityHeading(ped,v.h)
						vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
					else
						TriggerEvent("Notify","aviso","Existem paramédicos em serviço.")
					end
				end
			end
		end
		Wait(ms)
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

RegisterNetEvent('tratamento-macas')
AddEventHandler('tratamento-macas',function()
	TriggerEvent("cancelando",true)
	repeat
		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+1)
		Citizen.Wait(1500)
	until GetEntityHealth(PlayerPedId()) >= 400 or GetEntityHealth(PlayerPedId()) <= 100
	TriggerEvent("Notify","importante","Tratamento concluido.")
	TriggerEvent("cancelando",false)
end)