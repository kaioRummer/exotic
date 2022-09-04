Proxy = module("vrp", "lib/Proxy")
Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
func = Tunnel.getInterface("nation_gm")

fclient = {}

Tunnel.bindInterface("nation_gm", fclient)

config = {}

config.command = "painel"
config.admincommand = "paineladm"

