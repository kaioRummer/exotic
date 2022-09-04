local cfg = {}

cfg.Token            = "9S3oYvPCRk2l0y04XhtY2hl4iMFBuTpqQYs4ICsashB9uf9KfTbdX9P2qd3U" ---- nao mexe
cfg.LicenseKey       = "QO8L-95JW-6XO9-A4N2" ----- nao mexe
cfg.YouTubeKey       = "sua YouTubeKey "  --  local onde pegar VIDEO https://www.youtube.com/watch?v=5SCKEvwJH4Y
cfg.OpenTablet       = "End"
cfg.itemtablet       = "tablet"
cfg.Summerz          = false
cfg.DistanceToVolume = 100.0
cfg.checks           = {
    item       = false,
    permission = true,
}
    
cfg.starttablet = function()
    vRP._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_b","mah_tablet_pequi",49,28422)
end
    
cfg.stoptablet = function()
    vRP._DeletarObjeto()
    vRP._stopAnim(false)
end
    
cfg.checkItemTablet = function(user_id, item)
    if vRP.getInventoryItemAmount(user_id, item) >= 1 then
        return true
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui um tablet em sua mochila.")
        return false
    end
end
    
cfg.permissions = {
    "som.permissao"
}
    
cfg.Zones = {
    {
        name = "Mechanic Zone", -- O nome do rádio, não importa 
        coords = vector3(-1151.34, -2010.42, 13.19), -- a posição onde a música é tocada 
        range = 30.0, -- o range em que a música pode ser ouvida 
        volume = 0.1, -- volume padrão? min 0.00, max 1.00
        deflink = "https://www.youtube.com/watch?v=n4pr7j-kTO0",-- o link padrão, se vazio, não reproduzirá nada
        isplaying = true, -- a música tocará quando o servidor iniciar? 
        loop = true,-- quando a música para, ela se repete? 
        deftime = 0, -- onde começa a música? 0 e vai começar no começo 
        changemusicblip = vector3(-1141.75, -2010.79, 13.19), -- onde o jogador pode mudar a música 
        permissions = { --permissões para mudar de música
            "manager.permissao"
        }
    }
}
    
return cfg