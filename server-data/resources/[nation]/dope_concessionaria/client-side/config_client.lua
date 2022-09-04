config = {}

config.link = "concesionaria" -- seu ip com as imagens da conce ex: http://meuip/concessionaria

config.listColours = {
    "#000000",
    "#0000FF",
    "#008B8B",
    "#006400",
    "#FFFF00",
    "#8B0000"
} 
-- cores de carro em formato hex, converta o RGB por aqui
-- #https://www.rgbtohex.net/

config.locConce = {
    vec3(-29.8, -1104.29, 26.43)
} -- localização das concessionárias

config.testDrive = {
    loc = vec3(-39.88, -1111.37, 26.44), -- x,y,z
    h = 126.06,
} -- lolcalização do test drive - x,y,z,h

config.comands = {
    garage = "garagens", -- comando para abrir menu de comprar vagas
    cancelTestDrive = "acabarteste", -- comando para cancelar o tet drive
    anunciados = "anuncio", -- comando para abrir menu de anunciados
    tirarfoto = "comecarFotos", -- comando de tirar foto dos carros (aconselho tirar as fotos em localhost, elas vão salvar na msm pasta o cache ai é só copiar a pasta e colar dentro de nui)
    openDealer = "conce", -- comando para abrir a conce
    addEstoque = "estoque" -- comando para abrir menu de estoque
}

config.distance = {
    blipAnuncio = 5.0, -- distancia na qual aparecerá os blips de compra dos carros anunciados
    moreInfo = 1.2, -- distancia que aparecerá o texto para apertar E nos anuncios
    conce = 2.5 -- distancia na qual o player poderá acessar a concessionária
}

config.timeTestDrive = 30 -- tempo do teste drive em segundos

config.percentage = 60 -- quantos % ficará com a concessionária em uma venda na hora

config.prirceVaga = 50000 -- valor das vagas de garagem

config.dias = 3 -- Max de dias que poderá deixar um carro exposto

config.tecla = "E" -- Tecla que abrirá a concessionária 
