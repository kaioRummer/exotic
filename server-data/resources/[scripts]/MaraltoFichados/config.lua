cfg = {}

-- # Auth
cfg.clientID = ""
cfg.licenseKey = ""

-- # Comando para abrir o tablet
cfg.commandName = "fichar"
cfg.permissao = "policia.permissao"

-- # Permissão para limpar fichas
cfg.permissaoClearCriminal = "policia.permissao"

-- # Usar animação (pegar tablet nas mãos ao abrir) ?
cfg.useAnim = true

-- # UData key de Multas
cfg.keyMultas = "vRP:multas"

-- # Aqui é o seu Webhook para as imagens serem salvas
cfg.imageUploadWebhook = ""

-- # Texto de ajuda na camera
-- # (As dicas aparecem na tela porém não saem na foto)
cfg.useCameraTips = true
cfg.cameraTips = "~b~Clique esquerdo:~w~ tirar foto\n~b~Clique direito:~w~ cancelar\n~b~Scroll:~w~ zoom"

-- # Aqui você vai colocar o metódo da sua base para retornar se o jogador está procurado (true ou false)
cfg.procurado = function(source,user_id)
    return vRP.searchReturn(source,user_id) or false
end

-- # Configuração dos motivos de prisões
-- # agravanteLimit = limitar quantos motivos podem ser selecionados ([-1] == sem limite)
-- # countAgravante = valor de soma [MESES] para cada agravante. Ex. 0.5 (50%) = Maior Pena + 50% de cada agravante. / 0.0 para não somar agravantes.
-- # countAgravante = valor de soma [MULTA] para cada agravante. Ex. 0.5 (50%) = Maior Multa + 50% de cada agravante. / 0.0 para não somar agravantes.
cfg.predefined = {
    -- "Motivo/frase",meses,multa
    [1] = {"teste",1,1},
    [2] = {"Crime de procurado",15,10000},  
    [3] = {"Fuga da policia",15,10000},
    [4] = {"Furto de veículos de outrem",10,5000},
    [5] = {"Omissão e ocultação de provas",20,15000},
    [6] = {"Posse de dinheiro sujo - Acima de R$150.000",45,40000},
    [7] = {"Posse de dinheiro sujo - R$20.000 a R$150.000",25,25000},
    [8] = {"Posse de entorpecentes - Acima de 5 und",30,20000},
    [9] = {"Posse de itens ilegais (algemas, capuz, lockpick, etc)",20,10000},
    [10] = {"Uso de equipamento restrito",20,20000},
    [11] = {"Uso indevido de máscaras (ocultação facila",30,20000},
    [12] = {"Abuso de autoridade",60,40000},
    [13] = {"Agressão física",20,10000},
    [14] = {"Assalto à mão armada - Civil",15,20000},
    [15] = {"Desacato / Desobediência a autoridade",40,10000},  
    [16] = {"Furto a residências ou civil",15,5000},
    [17] = {"Homicídio culposo (sem intenção)",40,30000},
    [18] = {"Mandado de busca e apreensão",20,30000},
    [19] = {"Omissão de socorro",30,20000},
    [20] = {"Porte ilegal de armamento de fogo",40,30000},
    [21] = {"Roubo de veiculos de outrem",20,10000},
    [22] = {"Assalto a banco central",120,50000},
    [23] = {"Assalto a banco de Paleto",100,40000},
    [24] = {"Assalto a bancos Fleeca",90,40000},
    [25] = {"Assalto a joalheria",80,30000},  
    [26] = {"Assalto a lojas de conveniência / Ammunation",50,20000},
    [27] = {"Homicídio doloso (intenção)",60,50000},
    [28] = {"Roubo a caixa eletrônico e registradora",20,5000},
    [29] = {"Sequestro sem/com recompensa",30,20000},
}

cfg.inputReducao = true
cfg.maxInputReducao = 50
cfg.reduzirPena = true
cfg.reduzirMulta = false

cfg.agravanteLimit = 3
cfg.countAgravantePenas = 0.5
cfg.countAgravanteMultas = 0.1

-- # Configurações da prisão
-- # prisaoMode = [1]: usar o sistema integrado do MaraltoFichados OU [2]: usar seu próprio script/metodo de prisão
cfg.prisaoMode = 1

-- SE PRISAO MODE FOR == 1, CONFIGURAÇÕES DO SISTEMA DE PRISÃO ABAIXO: 
-- (Se for usar seu metodo, as configurações abaixo podem ser ignoradas)
-- # spawnEventName = seu evento de spawn do jogador [devem ser passados: function(user_id,source,first_spawn)]
-- # startLocation = lugar pra onde vai quando é preso
-- # endLocation = lugar pra onde vai quando termina a pena
-- # monthTime = tempo em segundos que irá durar cada mês
-- # minMonths = minimo de meses que a pessoa tem que passar presa (não dá pra reduzir mais fazendo os serviços)
-- # reducaoSystem ativar o sistema de redução de tempo
-- # reducaoMode = [1]: varrer o pátio | [2]: entrega de caixas
-- # reducaoMeses = quantos meses cada ação de redução vai diminuir na pena até chegar na pena minima (minMonths)
-- # reducaoMesesOtherPerms = sistema pra aumentar meses reduzidos por perm (ex: vips, etc); -- ATT: Colocar da menor pra MAIOR --
-- # screenTime = (true or false) = mostrar o tempo que resta de prisão na tela
-- # soltarCommand = comando pra soltar o jogador da prisao
-- # soltarCommandPermission = permissao para usar o comando de soltar o jogador
-- # [DEV FACILITIES] executeAoEntrar = executar métodos necessários ao prender [EXECUTADO VIA SERVER]
-- # [DEV FACILITIES] executeAoEntrar = executar métodos necessários ao acabar a pena / soltar [EXECUTADO VIA SERVER]
-- # useClothes = true or false - ativar preset de roupas de presidiário
-- # clotesPreset = se useClothes = true, defina o preset a ser colocado no ped.
cfg.spawnEventName = "vRP:playerSpawn" 
cfg.startLocation = {1655.62,2540.77,45.57,229.48}
cfg.endLocation = {1796.83,2598.11,45.57,8.29}
cfg.minMonths = 10
cfg.monthTime = 40
cfg.reducaoSystem = true
cfg.reducaoMode = 2
cfg.reducaoMeses = 1
cfg.reducaoMesesOtherPerms = {
    [1] = {"vip.prata",2},
    [2] = {"vip.ouro",3},
    [3] = {"vip.diamante",4},
    [4] = {"vip.rubi",5},
}
cfg.screenTime = true
cfg.soltarCommand = "soltar"
cfg.soltarCommandPermission = "dono.permissao"
cfg.executeAoEntrar = function(policial_id,user_id,motivo,tempo)
    local source = vRP.getUserSource(tonumber(user_id))
    if source then
        TriggerClientEvent("MillenniumPM:algemas",source,false)
    end
end
cfg.executeAoSair = function(source,user_id)
end
cfg.useClothes = true
cfg.clothesPreset = {
    --> 1885233650: mp_m_freemode_01 (masculino)
    --> -1667301416: mp_f_freemode_01 (feminino)
    [1885233650] = {                                      
        [1] = { -1,0 }, -- máscara
        [3] = { 0,0 }, -- maos
        [4] = { 7,15 }, -- calça
        [5] = { -1,0 }, -- mochila
        [6] = { 34,0 }, -- sapato
        [7] = { -1,0 },  -- acessorios
        [8] = { 15,0 }, -- blusa
        [9] = { -1,0 }, -- colete
        [10] = { -1,0 }, -- adesivo
        [11] = { 1,11}, -- jaqueta
		['p0'] = { -1,0}, -- chapeu
        ['p1'] = { -1,0}, -- oculos
		['p2'] = { -1,0},
		['p3'] = { -1,0},
		['p4'] = { -1,0},
		['p5'] = { -1,0},
		['p6'] = { -1,0},
		['p7'] = { -1,0},
		['p8'] = { -1,0},
		['p9'] = { -1,0},
		['p10'] = { -1,0},
    },
    [-1667301416] = {
        [1] = { -1,0 }, -- máscara
        [3] = { 0,0 }, -- maos
        [4] = { 45,2 }, -- calça
        [5] = { -1,0 }, -- mochila
        [6] = { 35,0 }, -- sapato
        [7] = { -1,0 },  -- acessorios
        [8] = { 7,0 }, -- blusa
        [9] = { -1,0 }, -- colete
        [10] = { -1,0 }, -- adesivo
        [11] = { 338,0}, -- jaqueta
		['p0'] = { -1,0}, -- chapeu
        ['p1'] = { -1,0}, -- oculos
		['p2'] = { -1,0},
		['p3'] = { -1,0},
		['p4'] = { -1,0},
		['p5'] = { -1,0},
		['p6'] = { -1,0},
		['p7'] = { -1,0},
		['p8'] = { -1,0},
		['p9'] = { -1,0},
		['p10'] = { -1,0},
    }
}

-- SE reducaoMode == 1 (modo varrer)
cfg.varrerLocs = {
	[1] = {1695.62,2518.75,45.57,137.33},
	[2] = {1678.51,2524.29,45.57,65.28},
	[3] = {1681.41,2508.53,45.57,200.08},
	[4] = {1664.68,2507.97,45.57,81.05},
	[5] = {1665.33,2493.92,45.57,297.67},
	[6] = {1641.4,2509.37,45.56,45.9},
	[7] = {1662.96,2544.57,45.57,337.41},
	[8] = {1679.3,2547.96,45.57,271.51}
}

-- SE reducaoMode == 2 (modo carregar caixas)
cfg.startCaixa = {1691.5,2566.18,45.57,170.53}
cfg.endCaixa = {1669.69,2487.96,45.83,99.56}

-- SE PRISAO MODE FOR == 2:
-- # Aqui você vai colocar o metódo da sua base caso for usá-lo para prender o jogador (é te passado os ids, o motivo e o tempo)
-- # Atenção: essa função será chamada via server
cfg.metprisao = function(policial_id,user_id,motivo,tempo)
    -- aqui --
end

return cfg