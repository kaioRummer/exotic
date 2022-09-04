local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("hawaii-lojinha")

func = {}
Tunnel.bindInterface("hawaii-lojinha", func)


function func.getItems()
    return config.items
end

function func.getMoney()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.getMoney(user_id)
end

function func.buyItem(item)
    local source = source
    local user_id = vRP.getUserId(source)
    local qtd, value = checkItem(item)
    if qtd then
        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(item)*qtd <= vRP.getInventoryMaxWeight(user_id) then
            if vRP.tryPayment(user_id,value) then
                vRP.giveInventoryItem(user_id,item,qtd)
                fclient.updateMoney(source,vRP.getMoney(user_id))
            else
               TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.") 
            end
        else
            TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
        end
    end
end

function checkItem(item)
    if item then
        for i in pairs(config.items) do
            for k,v in ipairs(config.items[i]) do
                if item == v.item then
                    return v.quantidade, v.compra
                end
            end
        end
    end
    return false
end