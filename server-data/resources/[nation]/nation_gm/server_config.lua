Proxy = module("vrp", "lib/Proxy")
Tunnel = module("vrp", "lib/Tunnel")
vRP = Proxy.getInterface("vRP")
func = {}
Tunnel.bindInterface("nation_gm", func)
fclient = Tunnel.getInterface("nation_gm")
vRP_groups = module("vrp", "cfg/groups")
config = {}
groups = {}
config.groups = {
    ["mecanica"] = {
        [1] = { onService = "LiderBennys", outService = "PaisanaLiderBennys" },
        [2] = { onService = "GerenteBennys", outService = "PaisanaGerenteBennys" },
        [3] = { onService = "TunagemBennys", outService = "PaisanaTunagemBennys" },
        [4] = { onService = "ReparoBennys", outService = "PaisanaReparoBennys" },
    },
    ["hospital"] = {
        [1] = { onService = "DiretorHP", outService = "PaisanaDiretorHP" },
        [2] = { onService = "MedicoHP", outService = "PaisanaMedicoHP" },
        [3] = { onService = "MedicoChefeHP", outService = "PaisanaMedicoChefeHP" },
        [4] = { onService = "EnfermeiroHP", outService = "PaisanaEnfermeiroHP" },
        [5] = { onService = "ViceDiretorHP", outService = "PaisanaViceDiretorHP" },
    },
    ["policia"] = {
        [1] = { onService = "coronel", outService = "coronelfolga" },
        [2] = { onService = "tenentecoronel", outService = "tenentecoronelfolga" },
        [3] = { onService = "major", outService = "majorfolga" },
        [4] = { onService = "capitao", outService = "capitaofolga" },
        [5] = { onService = "tenente", outService = "tenentefolga" },
        [6] = { onService = "sub-tenente", outService = "sub-tenentefolga" },
        [7] = { onService = "sargento", outService = "sargentofolga" },
        [8] = { onService = "pilototatico", outService = "aereo-folga" },
        [9] = { onService = "cabo", outService = "cabofolga" },
        [10] = { onService = "soldado", outService = "soldadofolga" },
        [11] = { onService = "recruta", outService = "recrutafolga" },
    },
    ["civil"] = {
        [1] = { onService = "comando-pcerj", outService = "comando-pcerj-folga" },
        [2] = { onService = "pcerj", outService = "pcerj-folga" },
    },
    ["bope"] = {
        [1] = { onService = "comando-bope", outService = "comando-bope-folga" },
        [2] = { onService = "bope", outService = "bope-folga" },
    },

    ["restaurante"] = {
        [1] = { onService = "chefe-restaurante", outService = "chefe-restaurante-folga" },
        [2] = { onService = "restaurante", outService = "restaurante-folga" },
    },

    --============  orgs criminosas 
    ["dk"] = {
        [1] = { onService = "lider-dk", outService = "lider-dk" },
        [2] = { onService = "dk", outService = "dk" },
    },
    ["roxos"] = {
        [1] = { onService = "lider-roxos", outService = "lider-roxos" },
        [2] = { onService = "roxos", outService = "roxos" },
    },
    ["verdes"] = {
        [1] = { onService = "lider-verdes", outService = "lider-verdes" },
        [2] = { onService = "verdes", outService = "verdes" },
    },
    ["ada"] = {
        [1] = { onService = "ada-lider", outService = "ada-lider" },
        [2] = { onService = "ada", outService = "ada" },
    },
    ["azul"] = {
        [1] = { onService = "lider-azul", outService = "lider-azul" },
        [2] = { onService = "azul", outService = "azul" },
    },
    ["motoclube"] = {
        [1] = { onService = "lider-motoclube", outService = "lider-motoclube" },
        [2] = { onService = "motoclube", outService = "motoclube" },
    },
    ["amarelos"] = {
        [1] = { onService = "lider-amarelos", outService = "lider-amarelos" },
        [2] = { onService = "amarelos", outService = "amarelos" },
    },
    ["vermelhos"] = {
        [1] = { onService = "lider-vermelhos", outService = "lider-vermelhos" },
        [2] = { onService = "vermelhos", outService = "vermelhos" },
    },
    ["bennys"] = {
        [1] = { onService = "lider-bennys", outService = "lider-bennys" },
        [2] = { onService = "bennys", outService = "bennys" },
    }
}

config.admin_permission = "admin.permissao"


vRP._prepare("nation_gm/getAllDataTables","SELECT * FROM vrp_user_data WHERE dkey = 'vRP:datatable'")
Citizen.CreateThread(function()
    for org in pairs(config.groups) do
        groups[org] = {}
    end
    local dataTables = vRP.query("nation_gm/getAllDataTables")
    for i, t in ipairs(dataTables) do
        local dataTable = json.decode(t.dvalue or {})
        if dataTable and dataTable.groups then
            local userOrg, userGroup = getUserInfo(dataTable.groups)
            if userOrg and userGroup then
                table.insert(groups[userOrg], { user_id = t.user_id,  group = userGroup or "none" })
            end
        end
    end
end)




function getUserInfo(userGroups)
    for org, t in pairs(config.groups) do 
        for i, v in ipairs(t) do
            if hasUserGroup(userGroups, v.onService) then
                return org, v.onService
            elseif hasUserGroup(userGroups, v.outService) then
                return org, v.outService
            end
        end
    end
end



function getServiceGroup(org,outService)
    if config.groups[org] then
        for i, t in ipairs(config.groups[org]) do
            if outService == t.outService or outService == t.onService then
                return t.onService
            end
        end
    end
    return false
end

function isUserInService(user_id)
    if not user_id or not vRP.getUserSource(user_id) then
        return false
    end
    local userOrg = getUserOrg(user_id)
    local group = vRP.getUserGroupByType(user_id,"primario")
    if userOrg and group then
        for i, t in ipairs(config.groups[userOrg]) do
            if group == t.onService then
                return true
            end
        end
    end
    return false
end




function getUserData(user_id, group)
    local identity = vRP.getUserIdentity(user_id)
    if identity then
        local name = identity.name.." "..identity.firstname
        local phone = identity.phone
        local org = getOrgByGroup(group)
        local group = getServiceGroup(org,group) or group
        local groupIndex = getGroupIndex(group)
        group = vRP.getGroupTitle(group) or group
        local inService = isUserInService(user_id)
        local rg = identity.registration 
        local age = identity.age
        return { user_id = user_id, name = name, phone = phone, group = group or "none", service = inService, age = age, rg = rg, groupIndex = groupIndex }
    end
end

function func.getUserInfo(user_id)
    local group = getUserGroup(user_id)
    local info = getUserData(user_id, group)
    return info
end


function getUserOrg(user_id)
    local userGroup = getUserGroup(user_id)
    for org, t in pairs(config.groups) do
        for i, v in ipairs(t) do
            if v.onService == userGroup or v.outService == userGroup then
                return org, user_id
            end
        end
    end
    return false
end

function func.getUserOrg(user_id)
    local source = source
    local user_id = user_id or vRP.getUserId(source)
    local userGroup = getUserGroup(user_id)
    for org in pairs(config.groups) do
        if config.groups[org][1].onService == userGroup or config.groups[org][1].outService == userGroup then
            return org, user_id
        end
    end
    return false
end


function func.getOrgInfo(orgName)
    local org = {}
    if groups[orgName] then
        for i,t in ipairs(groups[orgName]) do
            local user_id = t.user_id
            local group = t.group
            local info = getUserData(user_id, group)
            table.insert(org, info)
        end
        table.sort(org, function(a, b) return a.user_id < b.user_id end)
    end
    return org
end

function getUserGroup(user_id)
    local src = vRP.getUserSource(user_id)
    if src then
        local dataTable = vRP.getUserDataTable(user_id)
        local org, group = getUserInfo(dataTable.groups)
        if not group then
            group = vRP.getUserGroupByType(user_id,"primario")
        end
        return group
    else
        local dataTable = json.decode(vRP.getUData(user_id,"vRP:datatable") or {})
        if dataTable and dataTable.groups then
            local org, group = getUserInfo(dataTable.groups)
            if not group then
                for k,v in pairs(dataTable.groups) do
                    local kgroup = vRP_groups[k]
                    if kgroup then
                        if kgroup._config and kgroup._config.gtype and kgroup._config.gtype == "primario" then
                            group = k
                            break
                        end
                    end
                end
            end
            return group
        end
    end
    return false
end

function getOrgByGroup(group)
    for org, t in pairs(config.groups) do
        for i, v in ipairs(t) do
            if group == v.onService or group == v.outService then
                return org
            end
        end
    end
    return false
end


function hasUserGroup(userGroups,group)
    if userGroups[group] then return true end
    return false
end


function getUserTempOrg(user_id)
    for org, t in pairs(groups) do
        for i,v in ipairs(t) do
            if v.user_id == user_id then
                return org, i
            end
        end
    end
end


function getGroupIndex(group)
    for org, t in pairs(config.groups) do
        for i,v in ipairs(t) do
            if v.onService == group or v.outService == group then
                return i
            end
        end
    end
end



function func.getSelectedGroup(type, group, org)
    local source = source or 0
    local user_id = vRP.getUserId(source)
    if not group then
        group = getUserGroup(user_id)
        org = getOrgByGroup(group)
        group = getServiceGroup(org,group)
    end
    if groups[org] then
        local promoteGroup = group
        local groupIndex = #config.groups[org]
        for i, t in ipairs(config.groups[org]) do
            if group == t.onService then
                groupIndex = i 
                break
            end
        end
        if type == "promote" then
            if groupIndex == 1 then
                return false
            end
            groupIndex = groupIndex-1
        elseif type == "demote" then
            if groupIndex == #config.groups[org] then
                return false
            end
            groupIndex = groupIndex+1
        end
        promoteGroup = config.groups[org][groupIndex].onService
        return promoteGroup, vRP.getGroupTitle(promoteGroup)
    end
    return false
end





local manageTypes = {
    recruit = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            if userOrg and userOrg == org then
                return {success = false, title = "Cidadão já está na organização", text = ""}
            end
            local i = #config.groups[org]
            local group = config.groups[org][i].onService
          
            local src = vRP.getUserSource(user_id)
            if src then
                if not vRP.hasGroup(user_id,group) then
                    Citizen.CreateThread(function()
                        if vRP.request(src,"Você aceita fazer parte da organização <b>"..string.upper(org).."</b> ?", 30) then
                            vRP.addUserGroup(user_id, group)
                            TriggerClientEvent("Notify", source, "importante", "O passaporte <b>"..user_id.."</b> aceitou a solicitação para entrar na organização.")
                            TriggerClientEvent("Notify", src, "importante", "Você entrou para a organização <b>"..string.upper(org).."</b>.")
                            fclient.updateGM(source)
                        else
                            TriggerClientEvent("Notify", source, "aviso", "O passaporte <b>"..user_id.."</b> recusou a solicitação para entrar na organização.")
                        end
                    end)
                    return {success = true, title = "Solicitação enviada com sucesso!", text = ""}
                end
            else
                return {success = false, title = "Cidadão fora da cidade!", text = ""}
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    promove = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local i = getGroupIndex(getUserGroup(user_id))
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local promoteGroup, groupTitle = func.getSelectedGroup("promote",userGroup, userOrg)
                if promoteGroup then
                    local title = "Sucesso!"
                    local text = name.." #"..user_id.." promovido para o cargo de "..string.upper(groupTitle or promoteGroup)
                    local src = vRP.getUserSource(user_id)
                    if src then
                        vRP.addUserGroup(user_id, promoteGroup)
                        TriggerClientEvent("Notify", src, "importante", "Você foi promovido para <b>"..string.upper(groupTitle or promoteGroup).."</b>.")
                        fclient.updateGM(source)
                        return {success = true, title = title, text = text}
                    else
                        local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                        if dataTable and dataTable.groups then
                            local group = getUserGroup(user_id)
                            if group and dataTable.groups[group] then
                                dataTable.groups[group] = nil
                                dataTable.groups[promoteGroup] = true
                                vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                                removePlayerFromOrg(user_id, org)
                                addPlayerToOrg(user_id, org)
                                fclient.updateGM(source)
                                return {success = true, title = title, text = text}
                            end
                        end
                    end
                else
                    local title = "Erro!"
                    local text = "Cargo máximo já atingido!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    demote = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local group = getUserGroup(user_id)
            local i = getGroupIndex(group)
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local demoteGroup, groupTitle = func.getSelectedGroup("demote",userGroup, userOrg)
                if demoteGroup then
                    local title = "Sucesso!"
                    local text = name.." #"..user_id.." rebaixado para o cargo de "..string.upper(groupTitle or demoteGroup)
                    local src = vRP.getUserSource(user_id)
                    if src then
                        vRP.addUserGroup(user_id, demoteGroup)
                        TriggerClientEvent("Notify", src, "importante", "Você foi rebaixado para <b>"..string.upper(groupTitle or demoteGroup).."</b>.")
                        if user_id == vRP.getUserId(source) then
                            fclient.closeNui(source)
                        else
                            fclient.updateGM(source)
                        end

                        return {success = true, title = title, text = text, close = user_id == vRP.getUserId(source)}
                    else
                        local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                        if dataTable and dataTable.groups then
                            if group and dataTable.groups[group] then
                                dataTable.groups[group] = nil
                                dataTable.groups[demoteGroup] = true
                                vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                                removePlayerFromOrg(user_id, org)
                                addPlayerToOrg(user_id, org)
                                fclient.updateGM(source)
                                return {success = true, title = title, text = text}
                            end
                        end
                    end
                else
                    local title = "Erro!"
                    local text = "Cargo mínimo já identificado!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    dismiss = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            if not userOrg or userOrg ~= org then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            elseif user_id == vRP.getUserId(source) then
                return {success = false, title = "Você não pode se demitir!", text = ""}
            end
            local group = getUserGroup(user_id)
            local src = vRP.getUserSource(user_id)
            if src then
                if group then
                    vRP.removeUserGroup(user_id, group)
                end
                TriggerClientEvent("Notify", source, "importante", "O passaporte <b>"..user_id.."</b> não faz mais parte da organização.")
                TriggerClientEvent("Notify", src, "importante", "Você foi demitido da organização <b>"..string.upper(org).."</b>.")
                fclient.updateGM(source)
                return {success = true, title = "Sucesso!", text = "Passaporte "..user_id.." demitido com sucesso!"}
            else
                local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                if dataTable and dataTable.groups then
                    if group and dataTable.groups[group] then
                        dataTable.groups[group] = nil
                        vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                        removePlayerFromOrg(user_id, org)
                        fclient.updateGM(source)
                        return {success = true, title = "Sucesso!", text = "Passaporte #"..user_id.." demitido com sucesso!"}
                    else
                        return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
                    end
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,
}



function func.managePlayer(player_id, type, adminOrg)
    local source = source
    local user_id = vRP.getUserId(source)
    local org = func.getUserOrg(user_id) or adminOrg
    if vRP.hasPermission(user_id,config.admin_permission) or (org and player_id and type) then
        if manageTypes[type] then
            return manageTypes[type](player_id, org or func.getUserOrg(player_id), source)
        end
    end
    return {success = false, title = "Erro!", text = ""}
end





local serverResponses = {
    recruit = function(user_id, org, source)
        local userOrg = getUserTempOrg(user_id)
        if userOrg and userOrg == org then
            return {success = false, title = "Cidadão já está na organização", text = ""}
        elseif not vRP.getUserSource(user_id) then
            return {success = false, title = "Cidadão fora da cidade!", text = ""}
        end
        local identity = vRP.getUserIdentity(user_id)
        if identity then
            local title = "Confirmação de Recrutamento"
            local name = string.upper(identity.name.." "..identity.firstname)
            local text = "Deseja admitir "..name.." #"..user_id.." ?"
            return {success = true, title = title, text = text}
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    promove = function(user_id, org, source)
        if groups[org] then
            local userOrg,i = getUserTempOrg(user_id)
            local i = getGroupIndex(getUserGroup(user_id))
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local promoteGroup, groupTitle = func.getSelectedGroup("promote",userGroup, userOrg)
                if promoteGroup then
                    local title = "Confirmação de Promoção"
                    local text = "Deseja promover "..name.." #"..user_id.." para o cargo de "..string.upper(groupTitle or promoteGroup).." ?"
                    return {success = true, title = title, text = text}
                else
                    local title = "Erro!"
                    local text = "Cargo máximo já atingido!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    demote = function(user_id, org, source)
        if groups[org] then
            local userOrg,i = getUserTempOrg(user_id)
            local i = getGroupIndex(getUserGroup(user_id))
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local demoteGroup, groupTitle = func.getSelectedGroup("demote",userGroup, userOrg)
                if demoteGroup then
                    local title = "Confirmação de Rebaixamento"
                    local text = "Deseja rebaixar "..name.." #"..user_id.." para o cargo de "..string.upper(groupTitle or demoteGroup).." ?"
                    return {success = true, title = title, text = text}
                else
                    local title = "Erro!"
                    local text = "Cargo mínimo já identificado!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    dismiss = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            if not userOrg or userOrg ~= org  then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            elseif user_id == vRP.getUserId(source) then
                return {success = false, title = "Você não pode se demitir!", text = ""}
            end
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local title = "Confirmação de Demissão"
                local name = string.upper(identity.name.." "..identity.firstname)
                local text = "Deseja demitir "..name.." #"..user_id.." ?"
                return {success = true, title = title, text = text}
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,
}

function func.getServerResponse(player_id, type, adminOrg)
    local source = source
    local user_id = vRP.getUserId(source)
    local org = func.getUserOrg(user_id) or adminOrg
    if vRP.hasPermission(user_id,config.admin_permission) or (org and player_id and type) then
        if serverResponses[type] then
            return serverResponses[type](player_id, org or func.getUserOrg(player_id), source)
        end
    end
    return {success = false, title = "Erro!", text = ""}
end



function addPlayerToOrg(user_id, org)
    local userGroup = getUserGroup(user_id)
    local org = org or getOrgByGroup(userGroup)
    if userGroup and org and groups[org] then
        userGroup = getServiceGroup(org,userGroup) or userGroup
        table.insert(groups[org], { user_id = user_id, group = userGroup or "none" })
        -- print("ID "..user_id.." colocado na org "..org)
        return true
    end
    return false
end

function removePlayerFromOrg(user_id, org)
    local userGroup = getUserGroup(user_id)
    local org = org or getOrgByGroup(userGroup)
    local userTempOrg, i = getUserTempOrg(user_id)
    if groups[org] and userTempOrg and org == userTempOrg and i and groups[org][i] then
        table.remove(groups[org], i)
        -- print("ID "..user_id.." removido dar org "..org)
        return true
    end
    return false
end



function func.getAdminOrg()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,config.admin_permission) then
        local org = vRP.prompt(source,"Digite a organização: ","")
        if org and groups[org] then
            return org,user_id
        else
            TriggerClientEvent("Notify",source,"negado","Organização inexistente.")
        end
    end
    return false
end


 AddEventHandler('vRP:playerJoinGroup',function(user_id,group,gtype)
    if user_id and group and gtype and gtype == "primario" then
        addPlayerToOrg(user_id)
    end
 end)

 AddEventHandler('vRP:playerLeaveGroup',function(user_id,group,gtype)
    if user_id and group and gtype and gtype == "primario" then
        removePlayerFromOrg(user_id)
    end
 end)


