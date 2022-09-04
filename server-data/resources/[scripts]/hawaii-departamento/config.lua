local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
config = {}

config.items = {
	["itens"] = {
		{ item = "radio", quantidade = 1, compra = 5000, descricao = "Usado para se falar a distancia", img = "radio" },
		{ item = "mochila", quantidade = 1, compra = 10000, descricao = "Use para deixar mais kg na sua mochila", img = "mochila" },
		{ item = "roupas", quantidade = 1, compra = 10000, descricao = "Troque de roupas em qualquer lugar", img = "roupas" },
		{ item = "celular", quantidade = 1, compra = 7000, descricao = "Use o Celular !", img = "celular" },
		{ item = "repairkit", quantidade = 1, compra = 10000, descricao = "Reparar o Carro", img = "repairkit" },
		{ item = "gucci", quantidade = 1, compra = 10000, descricao = "Carteira", img = "gucci" },
		{ item = "lv", quantidade = 1, compra = 10000, descricao = "Carteira", img = "lv" },
	},
	["comida"] = {
		{ item = "agua", quantidade = 1, compra = 90, descricao = "", img = "agua" },
		{ item = "miojo", quantidade = 1, compra = 100, descricao = "", img = "miojo" },
		{ item = "cocacola", quantidade = 1, compra = 100, descricao = "", img = "cocacola" },
		{ item = "sprunk", quantidade = 1, compra = 130, descricao = "", img = "sprunk" },
		{ item = "sandwich", quantidade = 1, compra = 170, descricao = "", img = "sandwich" },
		{ item = "chocolate", quantidade = 1, compra = 270, descricao = "", img = "chocolate" },
		{ item = "coquetel", quantidade = 1, compra = 180, descricao = "", img = "coquetel" },
		{ item = "rosquinha", quantidade = 1, compra = 100, descricao = "", img = "rosquinha" },
		{ item = "batatinha", quantidade = 1, compra = 120, descricao = "", img = "batatinha" },
		{ item = "bolo", quantidade = 1, compra = 160, descricao = "", img = "bolo" },
	}
}	

config.itemNameList = true -- caso use vRP.itemNameList() para pegar o nome de algum item

function getItemName(item)
	if config.itemNameList then
		return vRP.itemNameList(item)
	end
	return vRP.getItemName(item)
end

for k in pairs(config.items) do
	for i in ipairs(config.items[k]) do
		config.items[k][i].name = getItemName(config.items[k][i].item)
	end
end



config.ammunations = {
	vec3( -2193.5114746094,2653.5759277344,4.5000023841858 ),
	vec3( 190.21139526367,-890.029296875,30.712995529175 ),
	vec3( -1365.7996826172,-616.47406005859,30.319414138794 ),
	vec3( 25.65,-1346.58,29.49 ),
	vec3( 2556.75,382.01,108.62 ),
	vec3( 1163.54,-323.04,69.20 ),
	vec3( -707.37,-913.68,19.21 ),
	vec3( -47.73,-1757.25,29.42 ),
	vec3( 373.90,326.91,103.56 ),
	vec3( -3243.10,1001.23,12.83 ),
	vec3( 1729.38,6415.54,35.03 ),
	vec3( 547.90,2670.36,42.15 ),
	vec3( 1960.75,3741.33,32.34 ),
	vec3( 2677.90,3280.88,55.24 ),
	vec3( 1698.45,4924.15,42.06 ),
	vec3( -1820.93,793.18,138.11 ),
	vec3( 1392.46,3604.95,34.98 ),
	vec3( -2967.82,390.93,15.04 ),
	vec3( -3040.10,585.44,7.90 ),
	vec3( 1135.56,-982.20,46.41 ),
	vec3( 1165.91,2709.41,38.15 ),
	vec3( -1487.18,-379.02,40.16 ),
}

