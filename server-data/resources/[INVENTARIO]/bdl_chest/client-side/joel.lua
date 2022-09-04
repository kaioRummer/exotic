local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------

src = {}
Tunnel.bindInterface("bdl_chest",src)
vSERVER = Tunnel.getInterface("bdl_chest")

--[ VARIAVEIS ]--------------------------------------------------------------------------------------------------------------------------

local chestTimer = 0
local chestOpen = ""
onMenu = false


--[ CHESTCLOSE ]-------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("chestClose",function(data)
	onMenu = false
	TransitionFromBlurred(1000)
	SetNuiFocus(false,false)
	TriggerEvent("bdl:triggerhud")
	SendNUIMessage({ action = "hideMenu" })
end)

--[ TAKEITEM ]---------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("takeItem",function(data)
	vSERVER.takeItem(tostring(chestOpen),data.item,data.amount)
end)

--[ STOREITEM ]--------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("storeItem",function(data)
	vSERVER.storeItem(tostring(chestOpen),data.item,data.amount)
end)

--[ AUTO-UPDATE ]------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("Chest:UpdateChest")
AddEventHandler("Chest:UpdateChest",function(action)
	SendNUIMessage({ action = action })
end)

--[ REQUESTCHEST ]-----------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("requestChest",function(data,cb)
	local inventario,inventario2,peso,maxpeso,peso2,maxpeso2 = vSERVER.openChest(tostring(chestOpen))
	if inventario then
		cb({ inventario = inventario, inventario2 = inventario2, peso = peso, maxpeso = maxpeso, peso2 = peso2, maxpeso2 = maxpeso2 })
	end
end)

--[ VARIAVEIS ]--------------------------------------------------------------------------------------------------------------------------

local chest = {

	{ "America", -811.75, 180.84, 76.75, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderAmerica",-812.03, 174.92, 76.75, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "Mafia", -2365.32, 1744.71, 212.14, "[~b~E~w~] Para ~b~ABRIR~w~ o baú da ~b~MAFIA~w~" },
	{ "LiderMafia", -2364.1, 1747.29, 215.48, "[~r~E~w~] Para ~r~ABRIR~w~ o baú da ~r~DP~w~" },

	{ "Correia",567.26, -3127.17, 18.77, "[~r~E~w~] Para ~r~ABRIR~w~ o baú da ~r~DP~w~" },
	{ "LiderCorreia",563.86, -3126.83, 18.77, "[~r~E~w~] Para ~r~ABRIR~w~ o baú da ~r~DP~w~" },

	{ "RufRuf",0, "[~y~E~w~] Para ~y~ABRIR~w~ o baú da ~y~TDT~w~" },
	{ "LiderRufRuf",0, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },

	{ "Vinhedo", -1866.3153076172,2061.2446289062,135.43447875977, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderVinhedo",-1876.2160644531,2060.8571777344,145.57345581055, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "Bahamas", -1368.64, -613.65, 30.32, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderBahamas",-1367.51, -625.52, 30.32, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "Yakuza", -886.33422851562,-1441.7713623047,7.5268054008484, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderYakuza",-881.55181884766,-1463.6062011719,7.5268054008484, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "Bratva", -2679.7397460938,1336.5537109375,144.25770568848, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderBratva",-2673.78, 1319.1, 152.02, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "Grota", 1273.93, -102.28, 85.8, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderGrota",1280.1, -311.79, 86.73, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "Fazenda", 1403.1645507812,1152.5714111328,114.3335647583, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderFazenda",1391.5731201172,1158.8077392578,114.33355712891, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "Vanilla", 108.56011962891,-1304.0747070312,28.768779754639, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderVanilla",95.436561584473,-1293.6497802734,29.268745422363, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "MotoClube", 987.19, -92.73, 74.85, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderMotoClube",977.01, -104.23, 74.85, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "TequiLaLa", -563.80383300781,279.65005493164,82.976654052734, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderTequiLaLa",-571.71154785156,288.94201660156,79.176635742188, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "Colombia", 1424.5686035156,6313.7993164062,35.090923309326, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderColombia",1567.3041992188,6366.9458007812,45.938613891602, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "America", 745.74176025391,-213.04528808594,83.282363891602, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "LiderAmerica",781.68701171875,-264.41024780273,77.716865539551, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },

	{ "LiderBennys",153.37, -3009.33, 10.71, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "mecanico",124.62, -3011.92, 7.05, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },


	{ "PRF1Paycheck",2609.06, 5344.62, 47.58, "[~c~E~w~] Para ~c~ABRIR~w~ o baú do ~c~CARTEL~w~" },

    { "PMESP2Paycheck",617.16, -4.89, 82.73, "[~c~E~w~] Para ~c~ABRIR~w~ o baú do ~c~CARTEL~w~" }, 
		
    { "PC1Paycheck",-915.62, -2031.28, 9.41, "[~c~E~w~] Para ~c~ABRIR~w~ o baú do ~c~CARTEL~w~" },
		
    { "EnfermeiroHP",-820.1, -1242.83, 7.34, "[~c~E~w~] Para ~c~ABRIR~w~ o baú do ~c~CARTEL~w~" },-------------820.22, -1242.8, 7.34

	
	{ "cartel",1403.06, 1152.65, 114.34,50,50,50, "[~c~E~w~] Para ~c~ABRIR~w~ o baú do ~c~CARTEL~w~" },
	{ "vanilla",-1795.78,-3128.79,13.95,50,50,50, "[~c~E~w~] Para ~c~ABRIR~w~ o baú do ~c~VANILLA~w~" },
	{ "bennys",-196.45, -1314.67, 31.27,50,50,50, "[~c~E~w~] Para ~c~ABRIR~w~ o baú da ~c~BENNYS~w~" },
}

--[ CHESTTIMER ]-------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		if chestTimer > 0 then
			chestTimer = chestTimer - 3
		end
	end
end)

--[ CHEST ]------------------------------------------------------------------------------------------------------------------------------

RegisterCommand("chest",function(source,args)
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	for k,v in pairs(chest) do
		local distance = GetDistanceBetweenCoords(x,y,z,v[2],v[3],v[4],true)
		if distance <= 2.0 and chestTimer <= 0 then
			chestTimer = 3
			if vSERVER.checkIntPermissions(v[1]) then
				onMenu = true
				TransitionToBlurred(1000)
				SetNuiFocus(true,true)
				TriggerEvent("bdl:triggerhud")
				SendNUIMessage({ action = "showMenu" })
				chestOpen = tostring(v[1])
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		for k,v in pairs(chest) do
			local distance = GetDistanceBetweenCoords(x,y,z,v[2],v[3],v[4],true)
			if distance < 5 then
				if not onMenu then
					idle = 5
					DrawMarker(23,v[2],v[3],v[4]-1,0,0,0,0,180.0,130.0,1.2,1.2,1.2,v[5],v[6],v[7],50,0,0,0,1)
					if distance <= 2 then
						DrawText3D(v[2],v[3],v[4],v[8])
						if distance < 1.1 then
							if IsControlJustPressed(0,38) and chestTimer <= 0 then
								chestTimer = 3
								if vSERVER.checkIntPermissions(v[1]) then
									onMenu = true
									TransitionToBlurred(1000)
									SetNuiFocus(true,true)
									TriggerEvent("bdl:triggerhud")
									SendNUIMessage({ action = "showMenu" })
									chestOpen = tostring(v[1])
								end
							end
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end