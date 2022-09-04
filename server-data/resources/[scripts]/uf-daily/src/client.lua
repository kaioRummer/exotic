local Tunnel      = module("vrp", "lib/Tunnel")
local Proxy       = module("vrp", "lib/Proxy")
vRPC              = Proxy.getInterface('vrp')
lServer           = Tunnel.getInterface(GetCurrentResourceName())
lClient           = {}
Tunnel.bindInterface(GetCurrentResourceName(), lClient)
userInfo          = {}

cfg = module(GetCurrentResourceName(), "config/config")

CreateThread(function() 
  while not lServer do Wait(1) end
  userInfo = lServer.getData()
  SendNUIMessage({
    case = 'setup',
    resName = GetCurrentResourceName(),
    config = cfg,
    lastItem = userInfo.lastGift
  })
  SetNuiFocus()
  if cfg.actions.login.chat_notify.enable then 
    TriggerEvent('chat:addMessage', {
      template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(39, 203, 255,1) 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>',
      args = { cfg.actions.login.chat_notify.message }
    })
  end
  if cfg.actions.login.event_notify.enable then 
    TriggerEvent('Notify','sucesso',cfg.actions.login.event_notify.message)
  end

  if cfg.actions.login.sound_beep.enable then 
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", true)
  end

end)



function lClient.updateInfoTable(data)
  userInfo = data
end


function lClient.init()
  while not lServer do Wait(100) end
  userInfo = lServer.getData()
  SendNUIMessage({
    case = 'setup',
    resName = GetCurrentResourceName(),
    config = cfg,
    lastItem = userInfo.lastGift
  })
  TriggerEvent("Notify", "sucesso","O dia se encerrou e uma nova chance para você ganhar prêmios começou! Digite /horas e aproveite.")
end

openNui = function() 
  if GetEntityHealth(PlayerPedId()) <= 101 then print('sem vida') return end
  if not userInfo then TriggerEvent("Notify", "negado","Evento não inicializado.") return end
  local time = userInfo.hours + ( (lServer.getTime() - userInfo.loginTime)/3600)
  SendNUIMessage({
    case = 'open',
    hours = time,
    lastItem = userInfo.lastGift
  })
  SetTimecycleModifier('hud_def_blur')
  SetNuiFocus(true, true)
end

RegisterNUICallback('reedemGift', function(data,cb)
  cb(lServer.reedemGift({probability = data.probability, randomIndex = data.itemIndex,lastHour = data.lastHour}))
end)


RegisterNUICallback('close', function(data,cb)
  if data.erro and string.match(data.erro,'carregada') then
    SendNUIMessage({
      case = 'setup',
      resName = GetCurrentResourceName(),
      config = cfg,
      lastItem = userInfo.lastGift
    })
  elseif data.erro ~= 'false' and not string.match(data.erro,'carregada') then 
    TriggerServerEvent("uf-daily:reportException", data.erro)
  end 
  ClearTimecycleModifier()
  SetNuiFocus()
  SendNUIMessage({case = 'close'})
  cb('ok')
end)

RegisterCommand(cfg.command, openNui)

RegisterNUICallback("reqConfig", function(data,cb) 
  SendNUIMessage({
    case = 'setup',
    resName = GetCurrentResourceName(),
    config = cfg,
    lastItem = userInfo.lastGift
  })
  cb('ok')
end)

RegisterNUICallback("playEffect", function(data) 
  if data.type == "navigation" then 
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
  elseif data.type == "click" then 
    PlaySoundFrontend(-1, "TENNIS_POINT_WON", "HUD_AWARDS",true)      
  elseif data.type == 'error' then 
    PlaySound(-1, "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
  end
end)