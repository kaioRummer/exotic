config = {}

config.permissions = {
    ["platina.permissao"] = 15,
    ["ouro.permissao"] = 10,
    ["toogle2.permissao"] = 5,
    ["admin.permissao"] = 3,
    ["discordbooster.permissao"] = 2,
} -- ['permissao'] = quantidade que irá somar no maximo de veiculos, caso ele tenha varias permissões dessas ele acumulará

config.desconto = {
    ["admin.permissao"] = 30,
    ["ouro.permissao"] = 20,
    ["prata.permissao"] = 10,
} -- ['permissao'] = % do desconto, caso ele tenha verias permissões dessas contará a maior %

config.logs = {
    buy = "", -- log de compra de carros
    sell = "", -- log de venda de carros para conce
    anuncioSet = "", -- log para quando os players anunciarem um veiculo
    anuncioBuy = "" -- log para quando comprarem os veiculos anunciados
} -- logs da concessionaria

config.permAdm = "admin.permissao" -- permissão de administrador para poder abrir o menu de estoque

config.maxAnuncios = 5 -- quantidade maxima de carros que poderão ser anunciados

config.maxCars = 5 -- quantidade maxima de carros que os players normais terão, caso seja vip somará com o beneficio do grupo dele

config.maxCarsBuy = 10 -- quantidade maxima de vagas que os players terão setado no banco de dados, caso ele tenha algum vip ou perm com vaga somará a esse valor