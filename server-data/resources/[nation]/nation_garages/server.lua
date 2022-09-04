
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
fclient = Tunnel.getInterface("nation_garages")
vRPclient = Tunnel.getInterface("vRP")

func = {}
Tunnel.bindInterface("nation_garages", func)

--------- MYSQL ------------


if not config.customMYSQL then
    vRP._prepare("vRP/createVehicleData", [[
        IF EXISTS(SELECT table_name 
            FROM INFORMATION_SCHEMA.TABLES
            WHERE table_name LIKE 'vrp_user_vehicles')
        THEN
            ALTER TABLE vrp_user_vehicles ADD IF NOT EXISTS estado TEXT DEFAULT '[]';
        ELSE
            IF EXISTS(SELECT table_name 
                FROM INFORMATION_SCHEMA.TABLES
                WHERE table_name LIKE 'vrp_vehicles')
            THEN
                ALTER TABLE vrp_vehicles ADD IF NOT EXISTS estado TEXT DEFAULT '[]';
            END IF;
        END IF;
    ]])

    vRP._prepare("vRP/create_ipva", "ALTER TABLE vrp_user_vehicles ADD IF NOT EXISTS ipva varchar(255) DEFAULT '1930912803'")
    vRP._prepare("vRP/getVehicles", "SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
    vRP._prepare("vRP/getVehicle", "SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
    vRP._prepare("vRP/setDetido", "UPDATE vrp_user_vehicles SET detido = @detido, time = @time, ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
    vRP._prepare("vRP/setIpva", "UPDATE vrp_user_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
    vRP._prepare("vRP/setVehicleData", "UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel, estado = @estado WHERE user_id = @user_id AND vehicle = @vehicle")
	vRP._prepare("creative/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)")
	vRP._prepare("creative/rem_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")	
	vRP._prepare("creative/get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
	vRP._prepare("creative/get_vehicle","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
	vRP._prepare("creative/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
	vRP._prepare("creative/rem_srv_data","DELETE FROM vrp_srv_data WHERE dkey = @dkey")
	vRP._prepare("Bjorn/get_homeuser","SELECT * FROM vrp_homes_permissions WHERE user_id = @user_id AND home = @home")
end




----------------------------

local spawnedVehicles = {}
local sharedKeys = {}


function func.checkOpenGarage()
    local source = source
    local user_id = vRP.getUserId(source)
    if config.checkOpenGarage then
        return config.checkOpenGarage(source,user_id)
    else
        return true
    end
end


--- RETORNA TRUE CASO O PLAYER SEJA DONO DA CASA DETERMINADA ---
function func.hasHome(home)
    local source = source
    local user_id = vRP.getUserId(source)
    return config.hasHome(source,user_id,home)
end

function func.getTime()
    return os.time()
end


--- RETORNA UMA TABLE COM TODOS OS VEÍCULOS DO PLAYER ---
function func.getVehicles()
    local source = source
    local user_id = vRP.getUserId(source)
    local vehicles = vRP.query("vRP/getVehicles", {user_id = user_id})
    for i in pairs(vehicles) do 
        vehicles[i].price = getVehiclePrice(vehicles[i].vehicle)
        vehicles[i].name = config.getVehicleModel(vehicles[i].vehicle)
        vehicles[i].ipva = parseInt(vehicles[i].ipva)
        if not vehicles[i].detido then
            vehicles[i].detido = vehicles[i].arrest
        end
    end
    return vehicles	
end

--- RETORNA UMA TABLE CONTENDO A TUNAGEM DE UM DETERMINADO VEÍCULO ---
function func.getVehicleTuning(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    if config.getVehicleMods then
        return config.getVehicleMods(source,user_id,vehicle)
    end
    local data = vRP.getSData("custom:u"..user_id.."veh_"..vehicle)
    local custom = json.decode(data)
    if custom then
        return custom
    end
    return false
end

--- RETORNA INFORMAÇÕES DO PORTA-MALAS DE UM DETERMINADO VEÍCULO ---
function func.getVehicleTrunkChest(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    local data = vRP.getSData("chest:u"..user_id.."veh_"..vehicle)
    local custom = json.decode(data)
    local vehInfo = func.getVehicleInfo(vehicle)
    local peso = 0
    local capacidade = 0
    if vehInfo then
        capacidade = vehInfo.capacidade
        if custom then
            for i in pairs(custom) do
                peso = parseInt(peso + (vRP.getItemWeight(i) * custom[i].amount))
            end
        end
    end
    return peso, capacidade
end

--- RETORNA O PREÇO DE UM DETERMINADO VEÍCULO PELA CONFIG ---
function getVehiclePrice(vehicle)
    return config.getVehiclePrice(vehicle)
end

--- RETORNA INFORMAÇÕES DE UM DETERMINADO VEÍCULO PELA CONFIG ---
function func.getVehicleInfo(vehicle)
    return config.getVehicleInfo(vehicle)
end

--- VERIFICAÇÃO DO VEÍCULO (SABER SE O PLAYER REALMENTE TEM O VEÍCULO E SE NAO ESTÁ DETIDO) ---
function func.checkVehicle(vehicle, type, hash, home, garage)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then
        return
    elseif config.server_side_check and spawnedVehicles[hash] and spawnedVehicles[hash][user_id] and spawnedVehicles[hash][user_id].inStreet then
        TriggerClientEvent("Notify",source,"negado","Você já tem um veículo deste modelo fora da garagem.",3000)
        fclient.toggleNui(source)
        return
    elseif config.checkPlayer and not config.checkPlayer(source, user_id, vehicle, garage) then
        fclient.toggleNui(source)
        return
    end
    if type and type == "service" then
        local vehicleInfo = { vehicle = vehicle, engine = 1000, body = 1000, fuel = 100 }
        fclient.checkSpot(source,vehicleInfo, vRP.getUserRegistration(user_id))
        return
    end
    local vehicleInfo = vRP.query("vRP/getVehicle", {user_id = user_id, vehicle = vehicle})
    if vehicleInfo and #vehicleInfo > 0 then
        if (vehicleInfo[1].detido and vehicleInfo[1].detido == 0) or (vehicleInfo[1].arrest and vehicleInfo[1].arrest == 0) then
            if config.payTax then
                if config.payTax(source,user_id,vehicle, home) then
                    fclient.checkSpot(source,vehicleInfo[1],vehicleInfo[1].plate)
                    return
                end
            else
                if not config.checkVehicleGarage or config.checkVehicleGarage(source,user_id,vehicle, garage) then
                    fclient.checkSpot(source,vehicleInfo[1],vehicleInfo[1].plate)
                    return
                end
            end
        else
            if parseInt(vehicleInfo[1].time) == 0 then
                TriggerClientEvent("Notify",source,"negado","Veículo apreendido.",3000)
            else
                TriggerClientEvent("Notify",source,"negado","Veículo detido.",3000)
            end
        end
        fclient.toggleNui(source)
    end
end


--- RETORNA TRUE CASO O PLAYER PAGUE A TAXA DO VEÍCULO COM SUCESSO ---
function func.tryPayTax(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    local type = config.getVehicleType(vehicle)
    if config.checkTax then
        local bool = config.checkTax(source,user_id, vehicle, type)
        return bool
    end
    local vehicleInfo = vRP.query("vRP/getVehicle", {user_id = user_id, vehicle = vehicle})
    
    if vehicleInfo and #vehicleInfo > 0 then
        local price = getVehiclePrice(vehicle)
        if vehicleInfo[1].detido == 0 and parseInt(tonumber(vehicleInfo[1].ipva) + 24 * 15 * 60 * 60) > parseInt(os.time()) then
            return true
        end
        if vehicleInfo[1].detido == 1 then
            if parseInt(vehicleInfo[1].time) == 0 then
                price = parseInt(price * (config.seguradora / 100))
            else
                price = parseInt(price * (config.detido / 100))
            end
        elseif type and type == "exclusive" then
            vRP.execute("vRP.setIpva", { user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time())})
            return true
        else
            price = parseInt(price * ((config.ipva or 1) / 100))
        end
        if config.use_tryFullPayment then
            if vRP.tryFullPayment(user_id, price) then
                vRP.execute("vRP/setDetido", { detido = 0, time = "0", user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time())})
                return true
            end
        elseif vRP.tryPayment(user_id, price) then
            vRP.execute("vRP/setDetido", { detido = 0, time = "0", user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time())})
            return true
        end
    end
    return false
end


--- GUARDA O VEÍCULO NA GARAGEM E SALVA SUAS INFORMAÇÕES NO BANCO DE DADOS ---
function func.saveVehicle(vehicle,plate,engine,body,fuel,estado)
    if not vehicle or not plate or not engine or not body or not fuel then
        return
    end
    local user_id = vRP.getUserByRegistration(plate) or vRP.getVehiclePlate(plate)
    if user_id then
        vRP.execute("vRP/setVehicleData", { engine = engine, body = body, fuel = fuel, estado = json.encode(estado or {}), user_id = user_id, vehicle = vehicle })
    end
end



--- CHECA SE O PLAYER TEM A PERMISSÃO PARA ACESSAR A GARAGEM DE SERVIÇO ---
function func.hasPermission(perm)
    if not perm then
        return true
    end
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,perm) then
        return true
    end
    TriggerClientEvent("Notify",source,"negado","Você não tem permissao",3000)
    return false
end


function func.addGarage()
    local source = source
    local user_id = vRP.getUserId(source)
    if config.addGarage then
        config.addGarage(source,user_id)
    end
end

--- SPAWNA O VEÍCULO VIA SERVER-SIDE PARA NÃO OCORRER BUGS (VEÍCULO NÃO SER DELETADO) ---
function func.spawnVeh(mhash, coords, h, plate)
    local source = source
    local user_id = vRP.getUserId(source)
    if config.antiflood then
        vRP.antiflood(source,"nation_garages:spawnVeh",config.antiflood)
    end
	local value = vRP.getUData(parseInt(user_id),"vRP:multas")
	local multas = json.decode(value) or 0
	if multas >= config.multas then
	TriggerClientEvent("Notify",source,"negado","Você tem multas pendentes.",10000)
	return true
	end
    local vehicle = CreateVehicle(mhash,coords.x,coords.y,coords.z+0.5,h,true,true)
    SetVehicleNumberPlateText(vehicle,plate)
end

function func.getVehiclePlate(veh)
    if config.getVehiclePlate then
        local source = source
        return config.getVehiclePlate(source,veh)
    end
    return false
end

------------------------------------------------------------------------
-------------------- VEÍCULOS INATIVOS ---------------------------------
------------------------------------------------------------------------

--- TABLE QUE ARMAZENA OS VEÍCULOS SPAWNADOS PELA GARAGEM ---
vehicles = {}


--- REGISTRA O VEÍCULO NA TABLE DOS VEÍCULOS SPAWNADOS PELA GARAGEM ---
function func.registerVehicle(netveh,hash)
    local source = source
    local user_id = vRP.getUserId(source)
    if spawnedVehicles[hash] then
        spawnedVehicles[hash][user_id] = { inStreet = true, netid = netveh }
    else
        spawnedVehicles[hash] = { [user_id] = { inStreet = true, netid = netveh } }
    end
    if config.reset then
        vehicles[#vehicles + 1] = { netveh = netveh, time =  config.tempoReset * 60 }
    end
end

--- REMOVE O VEÍCULO NA TABLE DOS VEÍCULOS SPAWNADOS PELA GARAGEM ---
function func.removeVehicle(netveh,hash,plate)
    local source = source
    local user_id = vRP.getUserByRegistration(plate) or vRP.getVehiclePlate(plate)
    if user_id and spawnedVehicles[hash] and spawnedVehicles[hash][user_id] then
        spawnedVehicles[hash][user_id] = false
    elseif spawnedVehicles[hash] then
        for i in pairs(spawnedVehicles[hash]) do 
            if spawnedVehicles[hash][i] and spawnedVehicles[hash][i].netid == netveh then
                spawnedVehicles[hash][i] = false
                break
            end
        end
    end
    if config.reset then
        for i in ipairs(vehicles) do 
            if vehicles[i].netveh == netveh then
                table.remove(vehicles,i)
                return
            end
        end
    end
end

RegisterServerEvent("nation:removeVehicle")
AddEventHandler("nation:removeVehicle", function(netveh,hash,plate)
    local source = source
    local user_id = vRP.getUserByRegistration(plate) or vRP.getVehiclePlate(plate)
    if user_id and spawnedVehicles[hash] and spawnedVehicles[hash][user_id] then
        spawnedVehicles[hash][user_id] = false
    elseif spawnedVehicles[hash] then
        for i in pairs(spawnedVehicles[hash]) do 
            if spawnedVehicles[hash][i] and spawnedVehicles[hash][i].netid == netveh then
                spawnedVehicles[hash][i] = false
                break
            end
        end
    end
end)

--- SE CONFIG.RESET FOR TRUE, FAZ UMA VERIFICAÇÃO DE 1 EM 1 MIN PARA SABER QUAIS VEÍCULOS ESTÃO INATIVOS ---
Citizen.CreateThread(function()
    vRP.execute("vRP/create_ipva")
    if not config.customMYSQL then
        vRP.execute("vRP/createVehicleData")
    end
    while config.reset do
        if #vehicles > 0 then
            local users = vRP.getUsers()
            for i in ipairs(vehicles) do 
                local active = false
                for j in ipairs(users) do 
                    local src = users[j]
                    if fclient.isVehicleActive(src,vehicles[i].netveh) then
                        active = true
                        vehicles[i].time = config.tempoReset * 60
                        break
                    end
                end
                if not active then
                    vehicles[i].time = vehicles[i].time - 60
                    if vehicles[i].time <= 0 then
                        fclient.deleteVehicle(-1,vehicles[i].netveh)
                        table.remove(vehicles,i)
                    end
                end
            end
        end
        Citizen.Wait(60*1000)
    end
end)

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


------------------------------------------------------------------------
------------------ TRANCAR . DESTRANCAR VEÍCULO ------------------------
------------------------------------------------------------------------

--- CASO O VEÍCULO MAIS PRÓXIMO DO PLAYER SEJA DELE, ACIONA O EVENTO DE TOGGLELOCK NO VEÍCULO ---
RegisterServerEvent("nation:tryLockNearestVehicle")
AddEventHandler("nation:tryLockNearestVehicle",function()
    local source = source
    local user_id = vRP.getUserId(source)
    local nearestPlate, name, price, bandido, vnet = fclient.getNearestVehicleInfo(source)
    if nearestPlate then
        nearestPlate = string.gsub(nearestPlate, "%s+", "")
        local plateOwnerId = vRP.getUserByRegistration(nearestPlate) or vRP.getVehiclePlate(nearestPlate) 
        if plateOwnerId and (user_id == plateOwnerId or canLockVehicle(user_id, name, plateOwnerId)) then
            fclient.toggleLock(source,vnet)
            TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
        end
    end
end)


function canLockVehicle(user_id, vname, owner)
    if user_id and vname and owner then
        local index = "key-"..vname.."-"..owner
        if sharedKeys[index] then
            for _,id in ipairs(sharedKeys[index]) do
                if id == user_id then
                    return true
                end
            end
        end
    end
    return false
end

--- SYNC DO TOGGLELOCK ---
RegisterServerEvent("nation:tryLockVehicle")
AddEventHandler("nation:tryLockVehicle",function(nveh)
    TriggerClientEvent("nation:syncLock",-1,nveh)
end)


RegisterServerEvent("nation:deleteVehicleSync")
AddEventHandler("nation:deleteVehicleSync",function(nveh)
    fclient.deleteVehicle(-1,nveh)
end)

------------------------------------------------------------------------

------------------------------------------------------------------------
----------------------- COMANDO DE DV ----------------------------------
------------------------------------------------------------------------

function sendWebhookMessage(webhook, user_id)
    if webhook then
        ---print("enviado")
        --PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "LOG_DV", content = "**[DV]**n```prologn[ID]: "..user_id.."n[DATA]: "..os.date("%d.%m.%Y [Hora]: %H:%M:%S").."nn```"}), { ['Content-Type'] = 'application.json' })
    end
end

RegisterCommand('dv',function(source)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,config.dv_permission) then
        local deletedVehicle = fclient.tryDeleteNearestVehicle(source)
        if deletedVehicle and config.webhook then
            sendWebhookMessage(config.webhook, user_id)
        end
    end
end)

RegisterCommand('chave',function(source, args)
    local user_id = vRP.getUserId(source)
    local keyCommands = {
        ["add"] = function(vehicle, id)
            if not vRP.getUserSource(id) then
                TriggerClientEvent("Notify", source, "aviso", "ID "..id.." não está online", 5000)
                return
            end
            local index = "key-"..vehicle.."-"..user_id
            if not sharedKeys[index] then
                sharedKeys[index] = { id }
                TriggerClientEvent("Notify", source, "sucesso", "Chave do veículo <b>"..vehicle.."<.b> emprestada para o ID <b>"..id.."<.b>", 5000)
            else
                for k,v in pairs(sharedKeys[index]) do
                    if id == v then
                        TriggerClientEvent("Notify", source, "aviso", "ID "..id.." já possui a chave desse veículo", 5000)
                        return
                    end
                end
                table.insert(sharedKeys[index], id)
                TriggerClientEvent("Notify", source, "sucesso", "Chave do veículo <b>"..vehicle.."<.b> emprestada para o ID <b>"..id.."<.b>", 5000)  
            end
        end,
        ["remove"] = function(vehicle, id)
            local index = "key-"..vehicle.."-"..user_id
            if sharedKeys[index] then
                for k,v in ipairs(sharedKeys[index]) do
                    if id == v then
                        table.remove(sharedKeys[index], k)
                        TriggerClientEvent("Notify", source, "importante", "Chave do veículo <b>"..vehicle.."<.b> removida do ID <b>"..id.."<.b>", 5000)  
                        return
                    end
                end
                TriggerClientEvent("Notify", source, "aviso", "ID "..id.." não possui a chave desse veículo", 5000)
            else
                TriggerClientEvent("Notify", source, "aviso", "ID "..id.." não possui a chave desse veículo", 5000)
            end
        end,
        ["list"] = function()
            local myvehicles = vRP.query("vRP/getVehicles", {user_id = user_id})
            local list = "Chaves emprestadas:"
            if #myvehicles > 0 then
                for i, veh in ipairs(myvehicles) do
                    local vehicle = veh.vehicle
                    local index = "key-"..vehicle.."-"..user_id
                    if sharedKeys[index] and #sharedKeys[index] > 0 then
                        list = list.."<br><b>"..vehicle.."<.b>: "
                        for k,v in ipairs(sharedKeys[index]) do
                            if k == #sharedKeys[index] then
                                list = list..v
                            else
                                list = list..v..",<br>"
                            end
                        end
                    end
                end
                if string.len(list) > 24 then
                    TriggerClientEvent("Notify",source,"importante", list)
                end
            end
        end
    }
    if args[1] and args[1] == "list" then
        keyCommands[args[1]]()
        return
    end
    if #args < 3 or not keyCommands[args[1]] then
        TriggerClientEvent("Notify", source, "aviso", "Utilize .chave <b>(add.remove) (veículo) (id)<.b>", 5000)
        return
    end
    local vehInfo = func.getVehicleInfo(args[2])
    local id = parseInt(args[3])
    local hasVehicle = vehInfo and #vRP.query("vRP/getVehicle", { user_id = user_id, vehicle = vehInfo.name }) > 0
    if not hasVehicle then
        TriggerClientEvent("Notify", source, "aviso", "Você não possui o veículo <b>"..args[2].."<.b>", 5000)
        return
    elseif not id or id < 1 or id == user_id then
        TriggerClientEvent("Notify", source, "aviso", "ID inválido", 5000)
        return
    end
    keyCommands[args[1]](vehInfo.name, id)
end)

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------
-- ANCORAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ancorar',function(source,args,rawCommand)
local source = source
local user_id = vRP.getUserId(source)
    local vehPlate,_,_,_,vnet = fclient.getNearestVehicleInfo(source)
    if vehPlate then
        local vehUser = vRP.getUserByRegistration(vehPlate) or vRP.getVehiclePlate(vehPlate) 
        if vehUser and user_id == vehUser then
            fclient.toggleAnchor(source,vnet)
        end
    end
end)


function func.checkAuth()
    return true 
end


-----------------------------------------------------------------------------------------------------------------------------------------
--[ CAR ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"dono.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
			if args[1] then
				TriggerClientEvent('spawnarveiculo2',source,args[1])
			end
		end
	end
end)

RegisterServerEvent("desmancheVehicles")
AddEventHandler("desmancheVehicles",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local nearestPlate, name, price, bandido, vnet, veh = fclient.getNearestVehicleInfo(source)
		if veh and nearestPlate then
		 local plateOwnerId = vRP.getUserByRegistration(nearestPlate) or vRP.getVehiclePlate(nearestPlate) 
			if plateOwnerId then
				vRP.execute("vRP/setDetido",{ user_id = parseInt(plateOwnerId), vehicle = name, detido = 1, time = parseInt(os.time()), ipva = parseInt(os.time()) })           
				vRP.giveInventoryItem(user_id,"dinheiro-sujo",parseInt(getVehiclePrice(name)*0.15))
				fclient.tryDeleteNearestVehicle(source)
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ REPARAR ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)


-----------------------------------------------------------------------------------------------------------------------------------------
--[ VEHS ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('vehs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] and parseInt(args[2]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[2]))
			local myvehicles = vRP.query("creative/get_vehicles",{ user_id = parseInt(user_id), vehicle = tostring(args[1]) })
			if myvehicles[1] then
				if config.getVehicleType(tostring(args[1])) == "exclusive" and not vRP.hasPermission(user_id,"administrador.permissao") then
					TriggerClientEvent("Notify",source,"negado","<b>"..config.getVehicleModel(tostring(args[1])).."</b> não pode ser transferido por ser um veículo <b>Exclusivo ou Alugado</b>.",10000)
				else
					local identity = vRP.getUserIdentity(parseInt(args[2]))
					local identity2 = vRP.getUserIdentity(user_id)
					local price = tonumber(sanitizeString(vRP.prompt(source,"Valor:",""),"\"[]{}+=?!_()#@%/\\|,.",false))			
					if vRP.request(source,"Deseja vender um <b>"..config.getVehicleModel(tostring(args[1])).."</b> para <b>"..identity.name.." "..identity.firstname.."</b> por <b>$"..vRP.format(parseInt(price)).."</b> dólares ?",30) then	
						if vRP.request(nplayer,"Aceita comprar um <b>"..config.getVehicleModel(tostring(args[1])).."</b> de <b>"..identity2.name.." "..identity2.firstname.."</b> por <b>$"..vRP.format(parseInt(price)).."</b> dólares ?",30) then
							local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(args[2]), vehicle = tostring(args[1]) })
							if parseInt(price) > 0 then
								if vRP.tryFullPayment(parseInt(args[2]),parseInt(price)) then
									if vehicle[1] then
										TriggerClientEvent("Notify",source,"negado","<b>"..identity.name.." "..identity.firstname.."</b> já possui este modelo de veículo.",10000)
									else
										vRP.execute("creative/move_vehicle",{ user_id = parseInt(user_id), nuser_id = parseInt(args[2]), vehicle = tostring(args[1]) })

										local custom = vRP.getSData("custom:u"..parseInt(user_id).."veh_"..tostring(args[1]))
										local custom2 = json.decode(custom)
										if custom2 then
											vRP.setSData("custom:u"..parseInt(args[2]).."veh_"..tostring(args[1]),json.encode(custom2))
											vRP.execute("creative/rem_srv_data",{ dkey = "custom:u"..parseInt(user_id).."veh_"..tostring(args[1]) })
										end

										local chest = vRP.getSData("chest:u"..parseInt(user_id).."veh_"..tostring(args[1]))
										local chest2 = json.decode(chest)
										if chest2 then
											vRP.setSData("chest:u"..parseInt(args[2]).."veh_"..tostring(args[1]),json.encode(chest2))
											vRP.execute("creative/rem_srv_data",{ dkey = "chest:u"..parseInt(user_id).."veh_"..tostring(args[1]) })
										end

										TriggerClientEvent("Notify",source,"sucesso","Você Vendeu <b>"..config.getVehicleModel(tostring(args[1])).."</b> e Recebeu <b>$"..vRP.format(parseInt(price)).."</b> dólares.",20000)
										TriggerClientEvent("Notify",nplayer,"importante","Você recebeu as chaves do veículo <b>"..config.getVehicleModel(tostring(args[1])).."</b> de <b>"..identity2.name.." "..identity2.firstname.."</b> e pagou <b>$"..vRP.format(parseInt(price)).."</b> dólares.",40000)
											vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
											vRPclient.playSound(nplayer,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
											vRP.giveMoney(user_id,parseInt(price))
											SendWebhookMessage(webhookvehs,"```prolog\n[ID]: "..user_id.." "..identity2.name.." "..identity2.firstname.." \n[VENDEU]: "..config.getVehicleModel(tostring(args[1])).." \n[PARA]: "..(args[2]).." "..identity.name.." "..identity.firstname.." \n[VALOR]: $"..vRP.format(parseInt(price)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
										end
									else
										TriggerClientEvent("Notify",nplayer,"negado","Dinheiro insuficiente.",8000)
										TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",8000)
									end
								end	
							end
						end
					end
				end
			else
				local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(user_id) })
				if #vehicle > 0 then 
	                local car_names = {}
	                for k,v in pairs(vehicle) do
	                	table.insert(car_names, "<b>" .. config.getVehicleModel(v.vehicle) .. "</b> ("..v.vehicle..")")
	                    --TriggerClientEvent("Notify",source,"importante","<b>Modelo:</b> "..v.vehicle,10000)
	                end
	                car_names = table.concat(car_names, ", ")
	                TriggerClientEvent("Notify",source,"importante","Seus veículos: " .. car_names, 20000)
				else 
					TriggerClientEvent("Notify",source,"importante","Você não possui nenhum veículo.",20000)
				end
			end
		end
	end)
	
	
-----------------------------------------------------------------------------------------------------------------------------------------
--[ HASH ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('hash',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"mindmaster.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
        local vehassh = fclient.getHash(source,vehiclehash)
        vRP.prompt(source,"Hash:",""..vehassh)
    end
end)