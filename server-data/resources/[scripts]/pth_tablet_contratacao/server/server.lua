--- vazamento por dogz1n community
--   vem para comunidade <3
--     discord.gg/dogz1n
  local Tunnel = module("vrp","lib/Tunnel")
  local Proxy = module("vrp","lib/Proxy")
  local Tools = module("vrp","lib/Tools")
  vRP = Proxy.getInterface("vRP")
 
  tabletS = {}
  Tunnel.bindInterface("pth_tablet_contratacao",tabletS)
 
  --[ BD ]-------------------------------------------------------------------------------------------------------------------------------------------------------------------
  vRP._prepare("pth_tablet_contratacao/insert_group", " INSERT INTO pth_tablet_contratos (user_id, nome, grupo) VALUES (@user_id, @nome, @grupo) ")
 
  vRP._prepare("pth_tablet_contratacao/delete_group"," DELETE FROM pth_tablet_contratos WHERE user_id = @user_id AND grupo = @grupo ")
 
  vRP._prepare("pth_tablet_contratacao/select_searchbyuserid"," SELECT * FROM pth_tablet_contratos WHERE user_id = @user_id ")
  vRP._prepare("pth_tablet_contratacao/select_searchbyuserid_grupo"," SELECT * FROM pth_tablet_contratos WHERE user_id = @user_id AND grupo = @grupo")
 
  --[ VARIAVEIS ]-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
  local lista_cargos = {}   -- [GRUPO] = {title = "GRUPO DESCRIÇÃO", blocklist = "BLCK LIST"}
 
  --[ TABLET ]-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
  RegisterCommand(Config.tabletComando,function(source,args,rawCommand)
      if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
   local identity = vRP.getUserIdentity(user_id)
 
      for k,v in pairs(Config.tabletPermissoes) do
          if vRP.hasPermission(user_id, k) then
  TriggerClientEvent('pth_tablet_contratacao:openTablet',source)
  tabletWH.SendWebhookMessage(source,Config.webhookTablet, "[ID]: "..user_id.." "..getNome(user_id).."\n[ABRIU TABLET DE CONTRATACAO]")
  return
          end
      end
      return
  end)
 
  function tabletS.getUserInfoTablet()
      if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
      local identity =vRP.getUserIdentity(user_id)
 
      local user_info = {}
 
      user_info.nome = getNome(user_id)
      user_info.grupo = ""
 
      for k,v in pairs(Config.tabletPermissoes) do
          if vRP.hasPermission(user_id, k) then
  user_info.grupo = user_info.grupo.."("..v.nome..")"
          end
      end
 
      return user_info
  end
 
  function tabletS.getGroups()
      if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
      local identity =vRP.getUserIdentity(user_id)
 
      local grupos = {}
 
      for k,v in pairs(Config.tabletPermissoes) do
          if vRP.hasPermission(user_id, k) then
       table.insert(grupos,v)
          end
      end
 
      return grupos
  end
 
  function tabletS.getDistinctGroupsbyUserId()
   if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
      local identity =vRP.getUserIdentity(user_id)
 
   local grupos = {}
   local grupos_add = {}
 
   for k,v in pairs(Config.tabletPermissoes) do
           if vRP.hasPermission(user_id, k) then
       for _,grupo in pairs(v.grupos) do
               for _,cargos in pairs(grupo.cargos) do
                       if not grupos_add[cargos.group] then
                               table.insert(grupos,{nome = v.nome, grupo_title = grupo.title, group = cargos.group, title = cargos.title })
                               grupos_add[cargos.group] = true
                       end
               end
       end
           end
   end
 
   return grupos
  end
 
  --[ gestaoequipe ]-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
  function tabletS.gestaoequipe_listacontratos( puser_id, pnome, pgrupo, pdata_inicio, pdata_fim)
      if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
      local identity =vRP.getUserIdentity(user_id)
 
      local grupos = getGroups_by_userid(user_id)
      local listacontratos = {}
 
   if grupos then
 
          local query = " SELECT * FROM pth_tablet_contratos "
          local where = ""
          local orderby = " ORDER BY user_id "
          local param = {}
 
          if puser_id and puser_id ~= "" then
  if where ~= "" then where=where.." AND " end
  where = where.." user_id = @user_id "
  param.user_id = puser_id
          end
          if pnome and pnome ~= "" then
  if where ~= "" then where=where.." AND " end
  where = where.." nome LIKE @nome "
  param.nome = "%"..pnome.."%"
          end
          if pdata_inicio and pdata_inicio ~= "" then
  if where ~= "" then where=where.." AND " end
  where = where.." data_inicio >= @data_inicio "
  param.data_inicio = pdata_inicio
          end
          if pdata_fim and pdata_fim ~= "" then
  if where ~= "" then where=where.." AND " end
  where = where.." data_inicio <= @data_fim "
  param.data_fim = pdata_fim
          end
 
          if pgrupo and pgrupo ~= "" then
  if where ~= "" then where=where.." AND " end
  where = where.." grupo = @grupo "
  param.grupo = pgrupo
          else
  local lista_grupos = ""
  for k,v in pairs(grupos) do
               lista_grupos = lista_grupos.."'"..v.group.."',"
  end
 
  if where ~= "" then where=where.." AND " end
  where = where.." grupo in ( "..lista_grupos:gsub(".?$","")..") "
          end
 
          if where~= "" then
  query = query.." WHERE "..where
          end
          query = query..orderby
 
          vRP._prepare("pth_tablet_contratacao/search_contratos"..user_id,query)
          local rows = vRP.query("pth_tablet_contratacao/search_contratos"..user_id,param)
 
          if #rows > 0 then
  for k,v in pairs(rows) do
      local dataini = ""
 
      if v.data_inicio and v.data_inicio ~= 0 then
          dataini = os.date('%Y-%m-%d %H:%M', parseInt(v.data_inicio/1000))
      end
 
      local servico = nil
      local psource = vRP.getUserSource(parseInt(v.user_id))
      if psource then
          ping = GetPlayerPing(psource)
          if ping > 0  and ping < 1000 then
              if not servico then
                  if vRP.hasGroup(parseInt(v.user_id),v.grupo) then
                      servico = true
                  else
                      servico = false
                  end
              end
          end
      end
 
      local pidentity = vRP.getUserIdentity(parseInt(v.user_id))
      local telefone = ""
      if pidentity then
          telefone = pidentity.phone
      end
 
      table.insert(listacontratos,{user_id = v.user_id, nome = v.nome, telefone = telefone, grupo = v.grupo, grupo_desc = lista_cargos[v.grupo].title, data_inicio = dataini, servico = servico })
  end
          end
      end
 
      return listacontratos
  end
 
  function tabletS.gestaoequipe_removegroup(puser_id, pgrupo)
   if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
      local identity =vRP.getUserIdentity(user_id)
 
   if can_deal_group(user_id, pgrupo) then
           vRP.execute("pth_tablet_contratacao/delete_group", {user_id = puser_id, grupo = pgrupo })
 
           if lista_cargos[pgrupo].blocklist and Config.tabletUsarBlockList then
       vRP.setUData(parseInt(puser_id),Config.tabletBlockListDB,json.encode(os.time()))
           end
 
           local psource = vRP.getUserSource(parseInt(puser_id))
           if psource then
       if vRP.hasGroup(parseInt(puser_id),pgrupo) then
               vRP.removeUserGroup(parseInt(puser_id),pgrupo)
               TriggerEvent('eblips:remove',psource)
               TriggerClientEvent('desligarRadios',psource)
               TriggerClientEvent(Config.Notify_Event,source,Config.Notify_Sucesso,"Você removeu o passaporte "..puser_id.." do grupo "..lista_cargos[pgrupo].title, 5000)
       end
           else
       local data = vRP.getUData(puser_id,"vRP:datatable")
       if data then
               local index  = json.decode(data)
               if index.groups then
                       if index.groups[pgrupo] then
                               index.groups[pgrupo] = nil
                               vRP.setUData(puser_id,"vRP:datatable",json.encode(index))
                               TriggerClientEvent(Config.Notify_Event,source,Config.Notify_Sucesso,"Você removeu o passaporte "..puser_id.." do grupo "..lista_cargos[pgrupo].title, 5000)
                       end
               end
       end
           end
 
           tabletWH.SendWebhookMessage(source, Config.webhookTabletRemoveGrupo, "[TABLET CONTRATAÇÃO - GESTÃO DE EQUIPE]\n[ID]: "..user_id.." "..getNome(user_id).."\n[REMOVEU GRUPO DE]: "..puser_id.." "..getNome(puser_id).."\n[GRUPO]: "..pgrupo.."\n[INFORMAÇÃO DELETADA DO BANCO DE DADOS]")
 
   end
 
  end
 
 
  --[ gestaocontrato ]-------------------------------------------------------------------------------------------------------------------------------------------------------------------
  function tabletS.gestaocontrato_getplayerinfo(puser_id)
      if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
      local identity =vRP.getUserIdentity(user_id)
 
      local dadosplayer = {}
 
      local puser_id = puser_id
      if puser_id then
          local pidentity = vRP.getUserIdentity(puser_id)
          if pidentity then
  dadosplayer.user_id = puser_id
  dadosplayer.telefone = pidentity.phone
  dadosplayer.name = getNome(puser_id)
 
       if Config.isCreative then
      dadosplayer.idade = ""
       else
      dadosplayer.idade = pidentity.age
       end
          end
      end
 
      return dadosplayer
  end
 
  function tabletS.gestaocontrato_getplayerGroups(puser_id)
   if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
      local identity =vRP.getUserIdentity(user_id)
 
   local groupos = {}
 
   if vRP.getUserSource(parseInt(puser_id)) then
           local groups = vRP.getUserGroups(parseInt(puser_id))
           for x,y in pairs(groups) do
       if lista_cargos[x] then
               table.insert(groupos,x)
       end
           end
   else
           local data = vRP.getUData(puser_id,"vRP:datatable")
           if data then
       local index  = json.decode(data)
       if index.groups then
               for k,l in pairs(index.groups) do
                       if lista_cargos[k] then
                               table.insert(groupos,k)
                       end
               end
       end
           end
   end
 
   return groupos
  end
 
  function tabletS.gestaocontrato_setusergrupos(puser_id, pgrupos)
   if not Config_auth.auth then return end
 
      local source = source
      local user_id = vRP.getUserId(source)
      local identity =vRP.getUserIdentity(user_id)
 
   local onblocklist
   local udata
   local dataBL
   if Config.tabletUsarBlockList then
           onblocklist = onblocklisttime(puser_id)
           udata = vRP.getUData(parseInt(puser_id),Config.tabletBlockListDB)
           dataBL = json.decode(udata) or 0
   end
 
   local grupos_a_setar = {}
   local grupos_searched = {}
   local mensagens = {}
 
   for _,g in pairs(pgrupos) do
           -- O GRUPO É DE BLOCKLIST E ESTÁ NO TEMPO DE BLOCK LIST?
           if lista_cargos[g].blocklist and onblocklist and Config.tabletUsarBlockList then
       TriggerClientEvent(Config.Notify_Event,source,Config.Notify_Negado,"Setagem do passaporte <b>"..puser_id.."</b> negada para o grupo  <b>"..vRP.getGroupTitle(g).."</b>.<br>Passaporte ainda na bocklist.<br>Tempo restante em blocklist: "..vRP.getDayHours(parseInt(dataBL+Config.tabletDiasBlockList*24*60*60 - os.time())), 5000)
       table.insert(mensagens, { style = "ERROR", msg = "Setagem negada para o grupo <b>"..lista_cargos[g].title.."</b>.<br>Passaporte ainda na bocklist.<br>Tempo restante em blocklist <b>"..os.date('%d Dias %H Horas e %M Minutos', parseInt(dataBL+Config.tabletDiasBlockList*24*60*60 - os.time()) ).."</b>"})
           else
       for k,v in pairs(Config.tabletPermissoes) do
               if vRP.hasPermission(user_id, k) then
                       for _,grupo in pairs(v.grupos) do
                               local exist = false
 
                               -- O GROUP FAZ PARTE DESTES CARGOS
                               for _,cargo in pairs(grupo.cargos) do
                                       if g == cargo.group then
                                               exist = true
                                               break
                                       end
                               end
 
                               if exist then
                                       if not grupos_searched[g] then
                                               grupos_searched[g] = true
 
                                               local rows = vRP.query("pth_tablet_contratacao/select_searchbyuserid_grupo",{ user_id = puser_id, grupo = g})
                                               -- SE O GRUPO QUE ESTÁ A ADICIONAR NÃO EXISTIR NA BD, REMOVE TODOS OS DO CONJUNTO
                                               if #rows == 0 then
                                                       if not listhasvalue(grupos_a_setar, g) then
                                                               table.insert(grupos_a_setar,g)
                                                       end
                                                       for _,cargo in pairs(grupo.cargos) do
                                                               -- DELETA TODOS OS GRUPOS DOS CONJUNTO DA BD E REMOVE DAS PERMISSOES
                                                               vRP.execute("pth_tablet_contratacao/delete_group", {user_id = puser_id, grupo = cargo.group })
                                                               local psource = vRP.getUserSource(parseInt(puser_id))
                                                               if psource then
                                                                       if vRP.hasGroup(parseInt(puser_id),cargo.group) then
                                                                               vRP.removeUserGroup(parseInt(puser_id),cargo.group)
                                                                               TriggerEvent('eblips:remove',psource)
                                                                               TriggerClientEvent('desligarRadios',psource)
 
                                                                               tabletWH.SendWebhookMessage(source, Config.webhookTabletEditGrupos, "[TABLET CONTRATAÇÃO - GESTÃO DE CONTRATO]\n[ID]: "..user_id.." "..getNome(user_id).."\n[REMOVEU O GRUPO]: "..g.."\n[DO PASSAPORTE]: "..puser_id)
                                                                       end
                                                               else
                                                                       local data = vRP.getUData(puser_id,"vRP:datatable")
                                                                       if data then
                                                                               local index  = json.decode(data)
                                                                               if index.groups then
                                                                                      if index.groups[cargo.group] then
 
index.groups[cargo.group] = nil
 
vRP.setUData(puser_id,"vRP:datatable",json.encode(index))
 
tabletWH.SendWebhookMessage(source, Config.webhookTabletEditGrupos, "[TABLET CONTRATAÇÃO - GESTÃO DE CONTRATO]\n[ID]: "..user_id.." "..getNome(user_id).."\n[REMOVEU O GRUPO]: "..g.."\n[DO PASSAPORTE]: "..puser_id)
                                                                                      end
                                                                               end
                                                                       end
                                                               end
                                                       end
                                               else
                                                       TriggerClientEvent(Config.Notify_Event,source,Config.Notify_Aviso,"Setagem do passaporte <b>"..puser_id.."</b> já existe para o grupo <b>"..vRP.getGroupTitle(g).."</b>", 5000)
                                                       table.insert(mensagens,{ style = "WARNING", msg = "Grupo <b>"..lista_cargos[g].title.."</b> já setado."})
                                               end
                                       end
                               end
                       end
               end
       end
           end
   end
 
 
 
   for _,g in pairs(grupos_a_setar) do
           if vRP.getUserSource(parseInt(puser_id)) then
       if not vRP.hasGroup(parseInt(puser_id),g) then
               vRP.addUserGroup(parseInt(puser_id),g)
               vRP.execute("pth_tablet_contratacao/insert_group", {user_id = puser_id, nome = getNome(puser_id), grupo = g })
               TriggerClientEvent(Config.Notify_Event,source,Config.Notify_Sucesso,"Voce setou o passaporte <b>"..puser_id.."</b> com o grupo <b>"..vRP.getGroupTitle(g).."</b>.", 5000)
               table.insert(mensagens,{ style = "SUCCESS", msg = "Grupo <b>"..lista_cargos[g].title.."</b> setado."})
 
               tabletWH.SendWebhookMessage(source, Config.webhookTabletEditGrupos, "[TABLET CONTRATAÇÃO - GESTÃO DE CONTRATO]\n[ID]: "..user_id.." "..getNome(user_id).."\n[SETOU]: "..puser_id.." "..getNome(puser_id).."\n[COM O GRUPO]: "..g)
       end
           else
       local data = vRP.getUData(puser_id,"vRP:datatable")
       if data then
               local index  = json.decode(data)
               if index.groups then
                       index.groups[g] = true
                       vRP.setUData(puser_id,"vRP:datatable",json.encode(index))
                       vRP.execute("pth_tablet_contratacao/insert_group", {user_id = puser_id, nome = getNome(puser_id), grupo = g })
                       TriggerClientEvent(Config.Notify_Event,source,Config.Notify_Sucesso,"Voce setou o passaporte <b>"..puser_id.."</b> com o grupo <b>"..vRP.getGroupTitle(g).."</b>.", 5000)
                       table.insert(mensagens,{ style = "SUCCESS", msg = "Grupo <b>"..lista_cargos[g].title.."</b> setado."})
 
                       tabletWH.SendWebhookMessage(source, Config.webhookTabletEditGrupos, "[TABLET CONTRATAÇÃO - GESTÃO DE CONTRATO]\n[ID]: "..user_id.." "..getNome(user_id).."\n[SETOU]: "..puser_id.." "..getNome(puser_id).."\n[COM O GRUPO]: "..g)
               end
       end
           end
   end
 
   return mensagens
 
  end
 
 
  --[ FUNÇÕES ]----------------------------------------------------------------------------------------------------------------------------------------------------------------
 
  function tabletS.getUserId()
   local source = source
   return vRP.getUserId(source)
  end
 
  function tabletS.getUserIdentity(user_id)
      local user_id = user_id
      return vRP.getUserIdentity(user_id)
  end
 
  function getNome(user_id)
      local identity = vRP.getUserIdentity(user_id)
      local nome = ""
      if identity then
          if Config.isCreative then
  nome = identity.name.." "..identity.name2
          else
  nome = identity.name.." "..identity.firstname
          end
      end
 
      return nome
  end
 
 
  function getGroups_by_userid(user_id)
      local grupos = {}
 
   for k,v in pairs(Config.tabletPermissoes) do
           if vRP.hasPermission(user_id, k) then
       for _,grupo in pairs(v.grupos) do
               for _,cargos in pairs(grupo.cargos) do
                       table.insert(grupos,{nome = v.nome, grupo_title = grupo.title, group = cargos.group, title = cargos.title })
               end
       end
           end
   end
 
      return grupos
  end
 
  function can_deal_group(user_id, group)
   local grupos = getGroups_by_userid(user_id)
   for _,grupo in pairs(grupos) do
           if grupo.group == group then
       return true
           end
   end
   return false
  end
 
  function onblocklisttime(user_id)
   local udata = vRP.getUData(parseInt(user_id),Config.tabletBlockListDB)
   local valor = json.decode(udata) or 0
   valor = parseInt(valor)
 
   if parseInt(os.time()) >= parseInt(valor + Config.tabletDiasBlockList*24*60*60) then
           return false
   end
 
   return true
  end
 
  function listhasvalue(list, value)
   for _,x in pairs(list)do
           if x == value then
       return true
           end
   end
   return false
  end
 
 
  Citizen.CreateThread(function()
      for k, permissoes in pairs(Config.tabletPermissoes) do
           for x,grupo in pairs(permissoes.grupos) do
       for l,cargo in pairs(grupo.cargos) do
               if not lista_cargos[cargo.group] then
                       lista_cargos[cargo.group] = {title = cargo.title, blocklist = cargo.blocklist}
               end
       end
           end
   end
  end)
 

  --- vazamento por dogz1n community
--   vem para comunidade <3
--     discord.gg/dogz1n