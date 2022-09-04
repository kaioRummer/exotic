local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
config = {}

config.items = {
	["armas brancas"] = {
		{ item = "wbody|WEAPON_KNIFE", quantidade = 1, compra = 7000, descricao = "", img = "knife" },
		{ item = "wbody|WEAPON_DAGGER", quantidade = 1, compra = 7000, descricao = "", img = "dagger" },
		{ item = "wbody|WEAPON_KNUCKLE", quantidade = 1, compra = 7000, descricao = "", img = "knuckle" },
		{ item = "wbody|WEAPON_MACHETE", quantidade = 1, compra = 7000, descricao = "", img = "machete" },
		{ item = "wbody|WEAPON_SWITCHBLADE", quantidade = 1, compra = 7000, descricao = "", img = "switchblade" },
		{ item = "wbody|WEAPON_WRENCH", quantidade = 1, compra = 7000, descricao = "", img = "wrench" },
		{ item = "wbody|WEAPON_HAMMER", quantidade = 1, compra = 7000, descricao = "", img = "hammer" },
		{ item = "wbody|WEAPON_GOLFCLUB", quantidade = 1, compra = 7000, descricao = "", img = "golfclub" },
		{ item = "wbody|WEAPON_CROWBAR", quantidade = 1, compra = 7000, descricao = "", img = "crowbar" },
		{ item = "wbody|WEAPON_HATCHET", quantidade = 1, compra = 7000, descricao = "Um machado é uma ferramenta de corte, ferramenta essa originária do martelo, sendo um martelo que tem pelo menos uma das extremidades amoladas e própria para o corte.", img = "hatchet" },
		{ item = "wbody|WEAPON_BAT", quantidade = 1, compra = 6000, descricao = "", img = "bat" },
		{ item = "wbody|WEAPON_BOTTLE", quantidade = 1, compra = 7000, descricao = "", img = "bottle" },
		{ item = "wbody|WEAPON_BATTLEAXE", quantidade = 1, compra = 7000, descricao = "", img = "battleaxe" },
		{ item = "wbody|WEAPON_POOLCUE", quantidade = 1, compra = 7000, descricao = "", img = "poolcue" },
		{ item = "wbody|WEAPON_STONE_HATCHET", quantidade = 1, compra = 8000, descricao = "", img = "stone_hatchet" },
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
	vec3( -2180.1608886719,2645.255859375,1.7554856538773 ),
	vec3( 1692.62,3759.50,34.70 ),
	vec3( 252.89,-49.25,69.94 ),
	vec3( 843.28,-1034.02,28.19 ),
	vec3( -331.35,6083.45,31.45 ),
	vec3( -663.15,-934.92,21.82 ),
	vec3( -1305.18,-393.48,36.69 ),
	vec3( -1118.80,2698.22,18.55 ),
	vec3( 2568.83,293.89,108.73 ),
	vec3( -3172.68,1087.10,20.83 ),
	vec3( 21.32,-1106.44,29.79 ),
	vec3( 811.19,-2157.67,29.61 ),
}

