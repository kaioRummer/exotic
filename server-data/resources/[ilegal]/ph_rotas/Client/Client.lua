local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-- DEVENVOLVIDO  BY  PH NEVES

oRP = {}
Tunnel.bindInterface(GetCurrentResourceName(),oRP)
vSERVER = Tunnel.getInterface(GetCurrentResourceName())

local blip = nil
local inService = false
local Position = 1
local timeSeconds = 0
local BlipRotas = Config.BlipRoutes

RegisterCommand(Config.Commands.Rota,function(source,args,rawCommand)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    if inService then
        inService = false
        TriggerEvent("Notify","sucesso",Config.Notify.StopService,5000)
		if DoesBlipExist(blip) then
			RemoveBlip(blip)
			blip = nil
		end 
    else
        if vSERVER.CheckPerm() then
            for k,v in pairs(Config.Locates) do
                local distance = #(coords - vector3(v[1],v[2],v[3]))
                if distance <= Config.Distance[1] then
                    StartThreadService()
                    StartThreadTimeSeconds()
                    inService = true
                    Position = 1
                    MakeBlipsPosition(BlipRotas,Position)
                    TriggerEvent("Notify","sucesso",Config.Notify.StartRoute,5000)
                end
            end
        else
            TriggerEvent("Notify","aviso",Config.Notify.NOPermission,5000)
        end
    end
end)

-- DEVENVOLVIDO  BY  PH NEVES

function StartThreadService()
	Citizen.CreateThread(function()
		while true do
			local timeDistance = 500
			if inService then
				local ped = PlayerPedId()
                local coordsPed = GetEntityCoords(ped)
                local distance = #(coordsPed - vector3(BlipRotas[Position][1],BlipRotas[Position][2],BlipRotas[Position][3]))
                if distance <= 10 then
                    timeDistance = 4
                    DrawMarker(21,BlipRotas[Position][1],BlipRotas[Position][2],BlipRotas[Position][3]-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
                    if distance <= 15 then
                        if IsControlJustPressed(1,38) and timeSeconds <= 0 then
                            timeSeconds = 2
                            if Position == #BlipRotas then
                                Position = 1
                                vSERVER.paymentMethod(true)
                            else
                                Position = Position + 1
                                vSERVER.paymentMethod(false)
                            end
                            TriggerEvent("cancelando",true)
                            TriggerEvent("cancelando",false)
                            vRP.removeObjects()
                            MakeBlipsPosition(BlipRotas,Position)
                        end
                    end
                end
			end
			Citizen.Wait(timeDistance)
		end
	end)
end

-- DEVENVOLVIDO  BY  PH NEVES

function StartThreadTimeSeconds()
	Citizen.CreateThread(function()
		while true do
			if timeSeconds > 0 then
				timeSeconds = timeSeconds - 1
			end
			Citizen.Wait(1000)
		end
	end)
end

function MakeBlipsPosition(BlipRotas,Position)
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
		blip = nil
	end

    -- DEVENVOLVIDO  BY  PH NEVES

	if not DoesBlipExist(blip) then
		blip = AddBlipForCoord(BlipRotas[Position][1],BlipRotas[Position][2],BlipRotas[Position][3],50.0)
		SetBlipSprite(blip,1)
        SetBlipColour(blip,5)
        SetBlipScale(blip,0.4)
        SetBlipAsShortRange(blip,false)
        SetBlipRoute(blip,true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Coleta de Itens")
        EndTextCommandSetBlipName(blip)
	end
end