local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("mecanico_coletar")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = true
local servico = false
local selecionado = 0
local CoordenadaX = 135.69
local CoordenadaY = -3007.75
local CoordenadaZ = 7.05
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
LOCAIS  ['x'] = 135.69, ['y'] = -3007.75, ['z'] = 7.05
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 391.99, ['y'] = -916.31, ['z'] = 29.78 },
	[2] = { ['x'] = -654.97, ['y'] = -414.08, ['z'] = 35.47 },
	[3] = { ['x'] = -1285.57, ['y'] = -567.0, ['z'] = 31.72 },
	[4] = { ['x'] = -1715.45, ['y'] = -447.14, ['z'] = 42.65 },
	[5] = { ['x'] = -1031.4, ['y'] = -903.08, ['z'] = 3.69 },
	[6] = { ['x'] = -582.12, ['y'] = -1044.02, ['z'] = 25.99 },
	[7] = { ['x'] = 10.2, ['y'] = -1668.13, ['z'] = 29.27 },
	[8] = { ['x'] = 408.14, ['y'] = -1490.03, ['z'] = 30.15 },
	[9] = { ['x'] = 967.94, ['y'] = -1829.34, ['z'] = 31.24 },
	[10] = { ['x'] = 352.68, ['y'] = -142.86, ['z'] = 66.69 },
	[11] = { ['x'] = 252.1, ['y'] = 358.47, ['z'] = 105.88 },
	[12] = { ['x'] = 645.87, ['y'] = 267.54, ['z'] = 103.24 },
	[13] = { ['x'] = -242.11, ['y'] = 279.58, ['z'] = 92.04 },
	[14] = { ['x'] = -1222.97, ['y'] = -174.25, ['z'] = 39.33 },
	[15] = { ['x'] = -1560.43, ['y'] = -949.93, ['z'] = 13.02 },
	[16] = { ['x'] = -1642.97, ['y'] = -411.59, ['z'] = 42.08 },
	[17] = { ['x'] = -448.23, ['y'] = -132.2, ['z'] = 39.09 },
	[18] = { ['x'] = 141.53, ['y'] = -379.84, ['z'] = 43.26 },
	[19] = { ['x'] = 391.17, ['y'] = -909.74, ['z'] = 29.42 },
	[20] = { ['x'] = 871.74, ['y'] = -1016.47, ['z'] = 31.87 },

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local evolution = 1000
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
			evolution = 5
				DrawMarker(31,CoordenadaX,CoordenadaY,CoordenadaZ-0.6,0,0,0,0.0,0,0,0.8,0.8,0.8,255, 142, 4,50,0,0,0,1)
				if distance <= 1.5 then
				evolution = 5
					drawTxt("PRESSIONE  ~o~E~w~  PARA INICIAR A ROTA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and emP.checkPermission() then
						servico = true
						selecionado = 1
						CriandoBlip(locs,selecionado)
					end
				end
			end
		end
		Citizen.Wait(evolution)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local evolution = 1000
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.7,0,0,0,0,180.0,130.0,1.0,1.0,0.5,240,200,80,30,1,0,0,1)
				if distance <= 1.5 then
				evolution = 5
					drawTxt("PRESSIONE  ~b~E~w~  PARA COLETAR OS ITENS",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and emP.checkPermission() then
                  if emP.checkPayment() then
                     RemoveBlip(blips)
                     if selecionado == #locs then
                        selecionado = 1
                     else
                        selecionado = selecionado + 1
                     end
                     CriandoBlip(locs,selecionado)
                  end
					end
				end
			end
      end
	  Citizen.Wait(evolution)
	end
end)

Citizen.CreateThread(function()
	while true do
      local evolution = 1000
      if servico then
	  evolution = 5
			drawTxt("~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR A ROTA ",4,0.270,0.905,0.45,255,255,255,200)
			drawTxt("VA ATÉ O DESTINO PARA COLETAR OS ~g~ITENS",4,0.270,0.93,0.45,255,255,255,200)
      end
	  Citizen.Wait(evolution)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			if IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
			end
		end
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

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coleta de Itens")
	EndTextCommandSetBlipName(blips)
end
