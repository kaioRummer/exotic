
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--==================================================== * VARIÁVEIS DE CONFIGURAÇÃO * ====================================================--

local limiteCofre = 2 --> Máxima quantidade de sacos que se pode pegar em cada cofre. (NUNCA deixar valor maior que 6)
local quantPguardar = 6 --> Quantidade de sacos que o player deve guardar no carro forte / (NUNCA deixar valor maior que 6)
local dist_show_marker = 30 --> Distância em que marcações serão visíveis ao player
local anyveh = true --> Se == true, então QUALQUER veículo ocupa as vagas. Se == false, apenas o carro forte(stockade) ocupa a vaga.

local pag_min = 500 --> Pagamento minimo por saco
local pag_max = 800 --> Pagamento maximo por saco


--> ATENÇÃO: NO VETOR ABAIXO ALTERAR APENAS AS COORDENADAS DOS BANCOS QUE VOCÊ QUEIRA USAR.
-- * Você também pode adicionar/remover bancos.
local local_cofre = {
	[1] = { ['ammount'] = 0, ['x'] = 144.97, ['y'] = -1044.83, ['z'] = 29.37 },
    [2] = { ['ammount'] = 0, ['x'] = 308.86, ['y'] = -282.81, ['z'] = 54.16 },
    [3] = { ['ammount'] = 0, ['x'] = -356.23, ['y'] = -53.01, ['z'] = 49.04 },
    [4] = { ['ammount'] = 0, ['x'] = 256.57, ['y'] = 219.6, ['z'] = 106.29 },
    [5] = { ['ammount'] = 0, ['x'] = -1213.2, ['y'] = -337.13, ['z'] = 37.78 },
}

--- PONTOS DE SPAWN DO CARRO FORTE ---
-- -34.89,-672.95,32.34
camSpawnA = { ['x'] = -34.89, ['y'] = -672.95, ['z'] = 32.34 } -- Primeira vaga
-- -18.85,-668.92,32.34
camSpawnB = { ['x'] = -18.85, ['y'] = -668.92, ['z'] = 32.34 } -- Segunda vaga
-- -35.39,-699.23,32.34
camSpawnC = { ['x'] = -35.39, ['y'] = -699.23, ['z'] = 32.34 } -- Terceira vaga
--------------------------------------------

--==================================================* FIM -> VARIÁVEIS DE CONFIGURAÇÃO *==================================================--





local veh = nil




local wergdfsagwerg = {
    [1] = {x=-9.98,y=-657.4,z=33.45},
}
local rteerwgfdsger = {}
local ab = false
local cd = false
local ef = false
local gh = {}
local ij = {}
local kl = {
    [1] = { ['l'] = -0.45, ['m'] = -3.0, ['b'] = false },
    [2] = { ['l'] = -0.0, ['m'] = -3.0, ['b'] = false },
    [3] = { ['l'] = 0.45, ['m'] = -3.0, ['b'] = false },
    [4] = { ['l'] = -0.45, ['m'] = -2.6, ['b'] = false },
    [5] = { ['l'] = 0.0, ['m'] = -2.6, ['b'] = false },
    [6] = { ['l'] = 0.45,['m'] = -2.6, ['b'] = false },
}
local mn = false
local op = nil
local qr = {} 
local st = false
local uv = 0
local wx = false
local abc = 'stockade'
local def = false
local ghi = "stockade"

RegisterNetEvent('thor_transportadora:permissao')
AddEventHandler('thor_transportadora:permissao',function()
	if not ab then
		ab = true
        vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
	    TriggerEvent("Notify","importante","Voce iniciou seu <b>trabalho</b>, pegue o <b>Carro Forte</b>!")
	end
end)
Citizen.CreateThread(function()

    CriandoBlip()

    while true do

        local thor = 1000

        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        local pedCoords = GetEntityCoords(ped)

        if Vdist(x,y,z,-34.39,-661.99,33.48) <= dist_show_marker+15 or Vdist(x,y,z,-91.09,-676.59,35.22) <= 15 then
            thor = 1
        end


        if (Vdist(x,y,z,-34.39,-661.99,33.48) <= dist_show_marker) and (not cd) then

            DrawText3D(-34.39,-661.99,33.48+0.55,"~g~[E] ~w~Pegar carro forte",1.5,1)
            DrawMarker(27,-34.39,-661.99,33.48-0.97,0,0,0,0.0,0,0,1.5,1.5,1.2,0,255,0,50,0,1,0,1) 
            DrawMarker(39,-34.39,-661.99,33.48-0.1,0,0,0,0.0,0,0,1.2,1.2,1.2,255,255,255,50,0,1,0,1) 

        elseif Vdist(x,y,z,-34.39,-661.99,33.48) <= dist_show_marker then

            DrawText3D(-34.39,-661.99,33.48+0.55,"~r~[H] ~w~Guardar carro forte",1.5,1)
            DrawMarker(27,-34.39,-661.99,33.48-0.97,0,0,0,0.0,0,0,1.5,1.5,1.2,255,0,0,50,0,1,0,1) 
            DrawMarker(39,-34.39,-661.99,33.48-0.1,0,0,0,0.0,0,0,1.2,1.2,1.2,255,255,255,50,0,1,0,1) 

        end

        if Vdist(x,y,z,-41.78,-664.18,33.48) <= dist_show_marker and not ab then

            DrawText3D(-41.78,-664.18,33.48+0.55,"~g~[E] ~w~Entrar em serviço",1.5,1)
            DrawMarker(27,-41.78,-664.18,33.48-0.97,0,0,0,0.0,0,0,1.5,1.5,1.2,0,255,0,50,0,1,0,1) 
            DrawMarker(2,-41.78,-664.18,33.48-0.14,0,0,0,0.0,0,0,0.6,0.6,0.6,255,255,255,50,1,1,0,0)

        elseif Vdist(x,y,z,-41.78,-664.18,33.48) <= dist_show_marker then

            DrawText3D(-41.78,-664.18,33.48+0.55,"~r~[H] ~w~Sair de serviço",1.5,1)
            DrawMarker(27,-41.78,-664.18,33.48-0.97,0,0,0,0.0,0,0,1.5,1.5,1.2,255,0,0,50,0,1,0,1) 
            DrawMarker(2,-41.78,-664.18,33.48-0.14,0,0,0,0.0,0,0,0.6,0.6,0.6,255,255,255,50,1,1,0,0) 

        end

        if Vdist(x,y,z,wergdfsagwerg[1].x,wergdfsagwerg[1].y,wergdfsagwerg[1].z) <= dist_show_marker then
            DrawText3D(wergdfsagwerg[1].x,wergdfsagwerg[1].y,wergdfsagwerg[1].z+0.10,"~g~[E] ~r~Entregar saco de dinheiro",1.0,1)
            DrawMarker(27,wergdfsagwerg[1].x,wergdfsagwerg[1].y,wergdfsagwerg[1].z-0.97,0,0,0,0.0,0,0,0.9,0.9,0.7,255,0,0,50,0,1,0,1) 
            DrawMarker(21,wergdfsagwerg[1].x,wergdfsagwerg[1].y,wergdfsagwerg[1].z-0.44,0,0,0,0.0,0,0,0.4,0.4,0.4,255,255,255,50,1,1,0,0) 
        end

        if ab and not mn then
            for k, index in pairs(local_cofre) do
                if Vdist(x,y,z,index.x,index.y,index.z) <= 5 then
                    thor = 1
                    DrawMarker(27,index.x,index.y,index.z-0.97,0,0,0,0.0,0,0,0.8,0.8,0.8,0,255,0,50,0,1,0,1)
                    DrawMarker(29,index.x,index.y,index.z-0.35,0,0,0,0.0,0,0,1.0,1.0,1.0,255,255,255,50,0,1,0,1) 
                    if Vdist(x,y,z,index.x,index.y,index.z) <= 2 then
                        DrawText3D(index.x,index.y,index.z+0.25,"~g~[E] ~w~Pegar Dinheiro",1.0,1)
                    end
                end
            end
        end

        if blipEntrega and (Vdist(x,y,z,-91.09,-676.59,35.22) <= 15) or (Vdist(x,y,z,-5.28,-669.73,31.94) <= 30) then
            RemoveBlip(blipEntrega)
        end

        Citizen.Wait(thor)
    end
end)
Citizen.CreateThread(function()

    if anyveh == true then
        abc = ''
    end

    while true do

        local thor = 1000

        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        local pedCoords = GetEntityCoords(ped)

        if Vdist(x,y,z,-41.78,-664.18,33.48) <= 10 then
            thor = 1
        end

        if Vdist(x,y,z,-41.78,-664.18,33.48) <= 1 and not ab and IsControlJustPressed(0,38) then
            
            TriggerServerEvent('thor_transportadora:permissao')    


                for i=11,0,-1 do
                    qr[i] = GetPedDrawableVariation(ped, i)
                    ij[i] = GetPedTextureVariation(ped, i)
                end

            local model = GetEntityModel(PlayerPedId())
        
            if model == `mp_m_freemode_01` then 

                SetPedComponentVariation(ped, 8, 58, 0, 1) 
                SetPedComponentVariation(ped, 11, 53, 0, 1)
                SetPedComponentVariation(ped, 4, 33, 0, 1) 
                SetPedComponentVariation(ped, 6, 25, 0, 1) 
                SetPedComponentVariation(ped, 3, 22, 0, 1) 
                SetPedComponentVariation(ped, 9, 1, 1, 1) 

                SetPedComponentVariation(ped, 1, 0, 0, 1) 
                SetPedComponentVariation(ped, 7, 0, 0, 1) 
                SetPedComponentVariation(ped, 5, 0, 0, 1) 
                SetPedComponentVariation(ped, 10, 0, 0, 1) 

            elseif model == `mp_f_freemode_01` then 

                SetPedComponentVariation(ped, 8, 31, 0, 1) 
                SetPedComponentVariation(ped, 11, 9, 0, 1) 
                SetPedComponentVariation(ped, 4, 32, 0, 1)
                SetPedComponentVariation(ped, 6, 25, 0, 1) 
                SetPedComponentVariation(ped, 3, 31, 0, 1) 
                SetPedComponentVariation(ped, 9, 1, 1, 1) 

                SetPedComponentVariation(ped, 1, 0, 0, 1)
                SetPedComponentVariation(ped, 7, 0, 0, 1)
                SetPedComponentVariation(ped, 5, 0, 0, 1)
                SetPedComponentVariation(ped, 10, 0, 0, 1)

            end

            RequestAnimDict('missmic4')
                                        
            while not HasAnimDictLoaded('missmic4') do
            Citizen.Wait(0)
            end

            TaskPlayAnim(ped, "missmic4", "michael_tux_fidget",2.0, -2.0, -1, 50, 0, false, false, false )
            Citizen.Wait(3400)
            ClearPedTasks(ped)


        elseif Vdist(x,y,z,-41.78,-664.18,33.48) <= 1 and ab and IsControlJustPressed(0,74) then

            if not cd then

                if blipEntrega then
                    RemoveBlip(blipEntrega)
                end

                for k,v in pairs(kl) do
                    v.b = false
                end

                for k, i in ipairs(rteerwgfdsger) do
                    RemoveBlip(rteerwgfdsger[k])
                end

                for k,index in pairs(local_cofre) do
                    index.ammount = 0
                end

                uv = 0
                gh = {}
                rteerwgfdsger = {}

                ab = false
                TriggerEvent("Notify","importante","Você saiu de serviço.")
                vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET") 

                for i=11,1,-1 do
                    SetPedComponentVariation(ped, i, qr[i],ij[i],1)
                end

                RequestAnimDict('clothingtie')
                                            
                while not HasAnimDictLoaded('clothingtie') do
                Citizen.Wait(0)
                end

                TaskPlayAnim(ped, "clothingtie", "try_tie_negative_a",2.0, -2.0, -1, 50, 0, false, false, false )
                Citizen.Wait(3500)
                ClearPedTasks(ped)

                tytytytytyty()

            else
                TriggerEvent("Notify","importante","Guarde o carro forte para sair de serviço.")
            end

        end

        if Vdist(x,y,z,-34.39,-661.99,33.48) <= 1 and not cd and IsControlJustPressed(0,38) then

            
            if ab then
                gbgbgbgb(1000)

                dist_cam = GetClosestVehicle(camSpawnA.x,camSpawnA.y,camSpawnA.z, 5.0, GetHashKey(abc), 70)
                dist2_cam = GetClosestVehicle(camSpawnB.x,camSpawnB.y,camSpawnB.z, 5.0, GetHashKey(abc), 70)
                dist3_cam = GetClosestVehicle(camSpawnC.x,camSpawnC.y,camSpawnC.z, 5.0, GetHashKey(abc), 70)

                if (dist_cam <= 10) then
                    ererererer(camSpawnA.x,camSpawnA.y,camSpawnA.z,ghi)
                    cd = true
                    criaBlipIndice()
                    TriggerEvent("Notify","importante","Você pegou o carro forte.")
                elseif  (dist2_cam <=10) then
                    ererererer(camSpawnB.x,camSpawnB.y,camSpawnB.z,ghi)
                    cd = true
                    criaBlipIndice()
                    TriggerEvent("Notify","importante","Você pegou o carro forte.")
                elseif (dist3_cam <=10) then
                    ererererer(camSpawnC.x,camSpawnC.y,camSpawnC.z,ghi)
                    cd = true
                    criaBlipIndice()
                    TriggerEvent("Notify","importante","Você pegou o carro forte.")
                else
                    TriggerEvent("Notify","importante","Todas as vagas estão ocupadas.")
                end

            else
                TriggerEvent("Notify","importante","Você precisa entrar em serviço para pegar o carro forte.")
            end

        elseif Vdist(x,y,z,-34.39,-661.99,33.48) <= 1 and cd and IsControlJustPressed(0,74) and DoesEntityExist(veh) and IsEntityAVehicle(veh) then

            distCarro = GetEntityCoords(veh)

            if Vdist(x,y,z,distCarro) <= 30 then
                gbgbgbgb(1000)
                tytytytytyty()
                DeleteVehicle(veh)
                veh = nil
                cd = false

                ooooooo()

                TriggerEvent("Notify","importante","Você guardou o carro forte.")
            else
                TriggerEvent("Notify","importante","O veículo está distante demais para ser guardado.")
            end

        end

        Citizen.Wait(thor)
    end

end)
Citizen.CreateThread(function()

    while true do

        local thor = 1000

        if ab then
            thor = 1
        end

        if IsControlJustPressed(0,168) and ab then
            wewewewewe()
        end

        Citizen.Wait(thor)
    end

end)
Citizen.CreateThread(function()

    while true do

        local thor = 1000

        if ab then
            thor = 1
        end

        if not (DoesEntityExist(veh) or IsEntityAVehicle(veh)) then
            cd = false
            ooooooo()
        end

        Citizen.Wait(thor)
    end

end)
Citizen.CreateThread(function()
    
    while true do

        local thor = 1000

        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))

        if ab and not mn then

            thor = 1
        
            for k, index in pairs(local_cofre) do
                local distancia =  Vdist(x,y,z,index.x,index.y,index.z)

                if Vdist(x,y,z,index.x,index.y,index.z) <= 5 and IsControlJustPressed(0,38) then

                    if DoesEntityExist(veh) and IsEntityAVehicle(veh) then

                        if uv < quantPguardar then

                            if st then

                                if index.ammount < limiteCofre then

                                    RequestAnimDict('anim@heists@narcotics@trash')
                                            
                                    while not HasAnimDictLoaded('anim@heists@narcotics@trash') do
                                    Citizen.Wait(0)
                                    end

                                    TaskPlayAnim(ped, "anim@heists@narcotics@trash", "pickup",2.0, -2.0, -1, 50, 0, false, false, false )
                                    Citizen.Wait(500)

                                    op = CreateObject(GetHashKey("prop_money_bag_01"),index.x,index.y,index.z,true,true,true)
                                    SetEntityCollision(op,false,false)
                                    vRP.playSound("Object_Collect_Player", "GTAO_FM_Events_Soundset") 
                                    AttachEntityToEntity(op,ped,GetPedBoneIndex(ped,28422),-0.06,0.13,-0.39,-180.0,-160.0,-65.0,true,true,true,true,0,true)
                                    SetEntityAsMissionEntity(op,true,true)
                                    mn = true
                                    index.ammount = index.ammount+1
                                    TriggerEvent("Notify","importante","Você pegou o dinheiro do cofre. Guarde no carro forte.")

                                    if index.ammount == limiteCofre then
                                        Citizen.Wait(1500)
                                        TriggerEvent("Notify","importante","Você esvaziou este cofre! Vá para outro banco.")
                                    end

                                else
                                    TriggerEvent("Notify","importante","Você já esvaziou este cofre. Dirija-se a outro banco!")        
                                end
                                    
                            else
                                TriggerEvent("Notify","importante","Primeiro abra a porta traseira do carro forte.")
                            end

                        else
                            TriggerEvent("Notify","importante","Você já pegou todo o dinheiro! Entregue os sacos na central.")
                        end

                    else
                        TriggerEvent("Notify","importante","Você precisa retirar um carro forte na central.")
                    end

                end
            end
        end

		Citizen.Wait(thor)
    end
end)
Citizen.CreateThread(function()
    
    while true do

        local thor = 1000

        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        
        local coordsStock = GetOffsetFromEntityInWorldCoords(veh, 0.0, -2.7, 0.0)
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),coordsStock.x,coordsStock.y,coordsStock.z,true)
        local coords = GetOffsetFromEntityInWorldCoords(veh,0.0,0.0,-5.0)

        if distance <= 6.0 then
            thor = 1
        else
            thor = 1000
        end

        if uv == quantPguardar then
            for k,index in pairs(local_cofre) do
                index.ammount = 0
            end
        end

		if distance <= 2.0 and not IsPedInAnyVehicle(PlayerPedId()) and ab then

            if not mn then
                if (st) then
                    DrawText3D(coordsStock.x+0.8,coordsStock.y-0.3,coordsStock.z+0.95,"~r~[E] ~w~Fechar",2,4)
                    if uv == quantPguardar then
                        DrawText3D(coordsStock.x,coordsStock.y,coordsStock.z+0.7,"[  ~r~"..uv.."~w~  /  ~b~ " ..quantPguardar.. "~w~ ]",1.5,4)
                    else
                        DrawText3D(coordsStock.x,coordsStock.y,coordsStock.z+0.7,"[  ~g~"..uv.."~w~  /  ~b~ " ..quantPguardar.. "~w~ ]",1.5,4)
                    end
                elseif not (st ) then
                    DrawText3D(coordsStock.x+0.8,coordsStock.y-0.3,coordsStock.z+0.95,"~g~[E] ~w~Abrir",2,4)
                end
            end

            if not mn then

                if not st then

                    if IsControlJustPressed(0,38) then

                        RequestAnimDict('mp_doorbell')
                                
                        while not HasAnimDictLoaded('mp_doorbell') do
                        Citizen.Wait(0)
                        end

                        TaskPlayAnim(ped, "mp_doorbell", "open_door",2.0, -2.0, -1, 50, 0, false, false, false )
                        Citizen.Wait(1800)
                        ClearPedTasks(ped)

                        SetVehicleDoorOpen(veh, 2, false, false)
                        SetVehicleDoorOpen(veh, 3, false, false)
                        st = true
                    end

                else

                    if IsControlJustPressed(0,38) then

                        RequestAnimDict('anim@veh@helicopter@havok@ds@enter_exit')
                                    
                        while not HasAnimDictLoaded('anim@veh@helicopter@havok@ds@enter_exit') do
                        Citizen.Wait(0)
                        end

                        TaskPlayAnim(ped, "anim@veh@helicopter@havok@ds@enter_exit", "d_close_out_no_door",2.0, -2.0, -1, 50, 0, false, false, false )
                        Citizen.Wait(300)
                        ClearPedTasks(ped)

                        SetVehicleDoorShut(veh, 2, false, false)
                        SetVehicleDoorShut(veh, 3, false, false)
                        st = false
                    end

                end

            end


            if (st) and mn and not wx then
                DrawText3D(coordsStock.x-0.2,coordsStock.y-0.3,coordsStock.z+0.95,"~b~[G] ~w~Guardar Saco de Dinheiro",1.2,4)

                if IsControlJustPressed(0,47) then

                    mn = false
                
                    if op then

                        if uv < quantPguardar then

                            RequestAnimDict('mp_common')
                                                
                            RequestAnimDict('anim@heists@narcotics@trash')
                        
                            while not HasAnimDictLoaded('anim@heists@narcotics@trash') do
                            Citizen.Wait(0)
                            end
            
                            TaskPlayAnim(ped, "anim@heists@narcotics@trash", "throw_a",8.0, -1.0, -1, 50, 0, false, false, false )
                            Citizen.Wait(500)
                            DeleteObject(op)
                            Citizen.Wait(500)
                            vRP.playSound("Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET")

                            for k, v in pairs(kl) do
                                if v.b == false then
                                    prop = CreateObject(GetHashKey("prop_money_bag_01"),coords.x,coords.y,coords.z,true,true,true)
                                    AttachEntityToEntity(prop,veh,0.0,v.l,v.m,0.48,0.0,0.0,0.0,false,false,true,false,2,true)
                                    FreezeEntityPosition(prop,true)
                                    table.insert(gh, prop)
                                    uv = uv+1
                                    if uv == quantPguardar then
                                        ef = true
                                        vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                                        TriggerEvent("Notify","importante","Você encheu o carro forte. Entregue no local marcado.")
                                        CriandoBlipEntrega()
                                    end
                                    v.b = true
                                    break
                                end

                            end

                        else
                            TriggerEvent("Notify","importante","Você já encheu o carro forte.")
                        end

                        while true do

                            if not (IsEntityPlayingAnim( ped, 'anim@heists@narcotics@trash', "throw_a", 3)) then
                                break
                            end
                            ClearPedTasks(ped)

                        end

                    end

                end

            end

            if (st) and uv > 0 and Vdist(x,y,z,wergdfsagwerg[1].x,wergdfsagwerg[1].y,wergdfsagwerg[1].z) <= 40 then

                DrawText3D(coordsStock.x-0.2,coordsStock.y-0.3,coordsStock.z+0.95,"~y~[G] ~w~Pegar Saco de Dinheiro",1.2,4)


                if IsControlJustPressed(0,47) and wx == false then

                    if ef then

                        ClearPedTasks(ped)

                        for k,v in pairs(gh) do


                            if gh[k] then

                                RequestAnimDict('anim@heists@narcotics@trash')
                                    
                                while not HasAnimDictLoaded('anim@heists@narcotics@trash') do
                                Citizen.Wait(0)
                                end

                                TaskPlayAnim(ped, "anim@heists@narcotics@trash", "pickup",2.0, -2.0, -1, 50, 0, false, false, false )

                                Citizen.Wait(500)

                                local actual_obj = gh[k]
                                table.remove( gh, k )
                                DeleteObject(actual_obj)

                                if kl[k] then
                                    kl[k].b = false
                                end

                                op = CreateObject(GetHashKey("prop_money_bag_01"),x,y,z,true,true,true)
                                SetEntityCollision(op,false,false)
                                vRP.playSound("Object_Collect_Player", "GTAO_FM_Events_Soundset") -- Som, pegando objeto
                                AttachEntityToEntity(op,ped,GetPedBoneIndex(ped,28422),-0.06,0.13,-0.39,-180.0,-160.0,-65.0,true,true,true,true,0,true)
                                SetEntityAsMissionEntity(op,true,true)

                                mn = true
                                wx = true

                                uv = uv-1

                                TriggerEvent("Notify","importante","Você pegou o dinheiro.")
                                
                                break
                            
                            else
                                TriggerEvent("Notify","importante","Você precisa coletar dinheiro.")
                            end

                        end

                    else
                        TriggerEvent("Notify","importante","Termine toda a coleta antes de entregar na central.")    
                    end

                end


            elseif uv == 0 then
                for k,v in pairs(kl) do
                    v.b = false
                end
                if blipEntrega then
                    RemoveBlip(blipEntrega)
                end
                gh = {}
                ef = false
            end

        end

		Citizen.Wait(thor)
    end
end)
Citizen.CreateThread(function()
    while true do

        local thor = 1000

        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))

        if not IsPedInAnyVehicle(PlayerPedId()) and ab then

            if Vdist(x,y,z,-9.98,-657.4,33.45) <= 8 then
                thor = 1
            end
        
            if Vdist(x,y,z,-9.98,-657.4,33.45) <= 2 and wx == true then
                if IsControlJustPressed(0,38) then
                    if op then

                        mn = false
                        wx = false

                        ClearPedTasks(ped)
                        
                        RequestAnimDict('mp_common')
                                                
                        while not HasAnimDictLoaded('mp_common') do
                        Citizen.Wait(0)
                        end

                        TaskPlayAnim(ped, "mp_common", "givetake1_a",2.0, -2.0, -1, 50, 0, false, false, false )

                        Citizen.Wait(500)
                        DeleteObject(op)
                        Citizen.Wait(500)

                        DeleteObject(op)

                        ClearPedTasks(ped)

                        local pagamento = math.random(pag_min,pag_max)
                        TriggerServerEvent('thor_transportadora:receber', pagamento)

                        vRP.playSound("PEYOTE_COMPLETED","HUD_AWARDS") -- Som ao ganhar dinheiro
                        TriggerEvent("Notify","importante","Você entregou um pacote e recebeu <b>R$" .. pagamento .. ",00</b>.") 

                    end
                end
            end
        end

        Citizen.Wait(thor)
    end
end)
Citizen.CreateThread(function()
    while true do

        local thor = 1000
        
        if ab then
            thor = 1
        end

        if not (DoesEntityExist(veh) or IsEntityAVehicle(veh)) then
            tytytytytyty()
        end

        Citizen.Wait(thor)
    end
end)
Citizen.CreateThread(function()

    RequestAnimDict('anim@heists@narcotics@trash')
                                
    while not HasAnimDictLoaded('anim@heists@narcotics@trash') do
    Citizen.Wait(0)
    end

    local ped = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(ped))
    local pedCoords = GetEntityCoords(PlayerPedId())

    while true do

        local thor = 1000

        if ab then
            thor = 1
        end

        if not (IsEntityPlayingAnim( ped, 'anim@heists@narcotics@trash', "walk", 3)) then
            if mn then
                TaskPlayAnim( ped, "anim@heists@narcotics@trash", "walk",2.6, 2.6, -1, 50, 0, false, false, false )
            end
        end
        Citizen.Wait(thor)
    end

end)
function tytytytytyty()
    for k, v in pairs(gh) do
        DeleteObject(v)
        Citizen.Wait(10)
    end
    gh = {}
end
function DrawText3D(x,y,z, text, scl, font) 
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local distB = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

	local scale = (1/distB)*scl
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	if onScreen then
		SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
	end
end
function ererererer(k,o,l,ghi)
	local mhash = ghi
	if not (DoesEntityExist(veh) or IsEntityAVehicle(veh)) then
	 while not HasModelLoaded(mhash) do
	  RequestModel(mhash)
	    Citizen.Wait(10)
	 end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		veh = CreateVehicle(mhash,k,o,l+0.5,190.38,true,false)
		SetVehicleIsStolen(veh,false)
		SetVehicleOnGroundProperly(veh)
		SetEntityInvincible(veh,false)
		SetVehicleNumberPlateText(veh,vRP.getRegistrationNumber())
		Citizen.InvokeNative(0xAD738C3085FE7E11,veh,true,true)
		SetVehicleHasBeenOwnedByPlayer(veh,false)
		SetVehicleDirtLevel(veh,0.0)
		SetVehRadioStation(veh,"OFF")
		SetVehicleEngineOn(GetVehiclePedIsIn(ped,false),true)
		SetModelAsNoLongerNeeded(mhash)
	end
end
function wewewewewe()

    if not (DoesEntityExist(veh) or IsEntityAVehicle(veh)) then
        local ped = PlayerPedId()
        ab = false
        if op then
            DeleteObject(op)
            op = nil
            ClearPedTasks(ped)
        end
        mn = false
         for i=11,1,-1 do
            SetPedComponentVariation(ped, i, qr[i],ij[i],1)
        end

        ooooooo()

        TriggerEvent("Notify","importante","Você saiu de serviço. A tecla <b>F7</b> foi pressionada.")
        vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET") -- SOM de cancelamento pelo F7
    else
        TriggerEvent("Notify","importante","Você precisa guardar o veículo para sair de serviço")
    end
    Citizen.Wait(1000)
end
function CriandoBlip()
	blip = AddBlipForCoord(-41.69,-664.41,33.48)
	SetBlipSprite(blip,487) 
	SetBlipColour(blip,60) 
	SetBlipScale(blip,0.6) 
	SetBlipAsShortRange(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central | Transportadora")
	EndTextCommandSetBlipName(blip)
end
function CriandoBlipEntrega()
    -- -91.09,-676.59,35.22
	blipEntrega = AddBlipForCoord(-91.09,-676.59,35.22)
	SetBlipSprite(blipEntrega,605) 
	SetBlipColour(blipEntrega,75) 
	SetBlipScale(blipEntrega,0.4) 
	SetBlipAsShortRange(blipEntrega,false)
	SetBlipRoute(blipEntrega,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entregar Dinheiro")
	EndTextCommandSetBlipName(blipEntrega)
end
function gbgbgbgb(time)
	DoScreenFadeOut(1200)
	Wait(time)
	DoScreenFadeIn(1200)
end
function ooooooo()

    if blipEntrega then
        RemoveBlip(blipEntrega)
    end

    for k,v in pairs(kl) do
        v.b = false
    end

    for k, i in ipairs(rteerwgfdsger) do
        RemoveBlip(rteerwgfdsger[k])
    end

    for k,index in pairs(local_cofre) do
        index.ammount = 0
    end

    cd = false
    mn = false
    op = nil
    veh = nil
    wx = false
    ef = false

    st = false
    uv = 0
    rteerwgfdsger = {}

end
function criaBlipIndice()

    for k, i in ipairs(local_cofre) do

        blip = AddBlipForCoord(local_cofre[k].x,local_cofre[k].y,local_cofre[k].z)
        SetBlipHiddenOnLegend(blip,true)
        SetBlipSprite(blip,9) 
        SetBlipColour(blip,5) 
        SetBlipAlpha(blip --[[ Blip ]], 65 --[[ integer ]])
        SetBlipScale(blip,0.6) 
        SetBlipAsShortRange(blip,true)
        SetBlipRoute(blip,false)
        table.insert(rteerwgfdsger, blip)

        blipB = AddBlipForCoord(local_cofre[k].x,local_cofre[k].y,local_cofre[k].z)
        SetBlipSprite(blipB,271)
        SetBlipColour(blipB,47) 
        SetBlipScale(blipB,0.2) 
        SetBlipAsShortRange(blipB,true)
        SetBlipRoute(blipB,false)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Coleta | Dinheiro")
        EndTextCommandSetBlipName(blipB)
        table.insert(rteerwgfdsger, blipB)

    end

end