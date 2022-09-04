local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRPclient = Tunnel.getInterface("vRP")
arc = {}
Tunnel.bindInterface("Arc-Wall",arc)
Proxy.addInterface("Arc-Wall",arc)
vRP = Proxy.getInterface("vRP")

Config = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- GET USER ID AND STEAMHEX
-----------------------------------------------------------------------------------------------------------------------------------------	
function arc.getId(sourceplayer)
    local sourceplayer = sourceplayer
	if sourceplayer ~= nil and sourceplayer ~= 0 then
		local user_id = vRP.getUserId(sourceplayer)
		if user_id then
			return user_id
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- USER PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------	

function arc.getPermissao(toogle)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,Config.permissaoesp) then
        return true
    else
        return false
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--Webhook (LINES)
-----------------------------------------------------------------------------------------------------------------------------------------
function arc.reportlinesLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
        local imageurl = "https://i.imgur.com/LxhQV2o.png"
        PerformHttpRequest(Config.webhooklines, function(err, text, headers) end, 'POST', json.encode({username = ' Sense City - Sistema de Wall e Lines ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**Um administrador ``ativou`` o /lines**",
                    fields = {
                        { 
                            name = "**ID do Administrador:\n**",
                            value = "**"..identity.name.." "..identity.firstname.." ["..user_id.."]**"
                        },

                        {                        
							name = "``Qualquer uso deste comando sem autorização ou cargo para usar será passivo de adv!!.``\n",
							value = "``Atenciosamente DEV Bruxo.``"
						}
                    }, 
                    footer = { 
                        text = "Sense City - BR - "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "https://i.imgur.com/LxhQV2o.png"
                    },
                    color = 3093194 
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

function arc.reportunlinesLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
        local imageurl = "https://i.imgur.com/LxhQV2o.png"
        PerformHttpRequest(Config.webhooklines, function(err, text, headers) end, 'POST', json.encode({username = ' Sense City - Sistema de Wall e Lines  ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**Um administrador ``desativou`` o /lines**",
                    fields = {
                        { 
                            name = "**ID do Administrador:\n**",
                            value = "**"..identity.name.." "..identity.firstname.." ["..user_id.."]**"
                        },

                        {                        
							name = "``Qualquer uso deste comando sem autorização ou cargo para usar será passivo de adv!!.``\n",
							value = "``Atenciosamente DEV Bruxo.``"
						}
                    }, 
                    footer = { 
                        text = "Sense City - BR - "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "https://i.imgur.com/LxhQV2o.png"
                    },
                    color = 3093194 
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--Webhook (WALL)
-----------------------------------------------------------------------------------------------------------------------------------------
function arc.reportwallLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
        local imageurl = "https://i.imgur.com/LxhQV2o.png"
        PerformHttpRequest(Config.webhookwall, function(err, text, headers) end, 'POST', json.encode({username = ' Sense City - Sistema de Wall e Lines  ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**Um administrador ``ativou`` o /Wall**",
                    fields = {
                        { 
                            name = "**ID do Administrador:\n**",
                            value = "**"..identity.name.." "..identity.firstname.." ["..user_id.."]**"
                        },

                        {                        
							name = "``Qualquer uso deste comando sem autorização ou cargo para usar será passivo de adv!!.``\n",
							value = "``Atenciosamente DEV Bruxo.``"
						}
                    }, 
                    footer = { 
                        text = "Sense City - BR - "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "https://i.imgur.com/LxhQV2o.png"
                    },
                    color = 1286027
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

function arc.reportunwallLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
        local imageurl = "https://i.imgur.com/LxhQV2o.png"
        PerformHttpRequest(Config.webhookwall, function(err, text, headers) end, 'POST', json.encode({username = ' Sense City - Sistema de Wall e Lines  ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**Um administrador ``desativou`` o /Wall**",
                    fields = {
                        { 
                            name = "**ID do Administrador:\n**",
                            value = "**"..identity.name.." "..identity.firstname.." ["..user_id.."]**"
                        },

                        {                        
							name = "``Qualquer uso deste comando sem autorização ou cargo para usar será passivo de adv!!.``\n",
							value = "``Atenciosamente DEV Bruxo.``"
						}
                    }, 
                    footer = { 
                        text = "Sense City - BR - "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "https://i.imgur.com/LxhQV2o.png"
                    },
                    color = 1286027
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end


print("^2 WALL INICIADO COM SUCESSO")