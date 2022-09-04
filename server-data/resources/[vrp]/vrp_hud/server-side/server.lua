local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
src = {}
Tunnel.bindInterface(GetCurrentResourceName(),src)
Proxy.addInterface(GetCurrentResourceName(),src)

function src.antidevtools()
    local source = source
    local user_id = vRP.getUserId(source)
    vRP.kick(source,"Você foi kikado do servidor ID:"..user_id)
end