--===============================
-- by JUST INTERIOR STUDIO
-- Discord UncleJust#0001
--===============================

local int_id = GetInteriorAtCoords(-522.0983,-1743.3666,16.7261)

--==============================================================
--НАСТРОЙКИ НАХОДЯТ В САМОМ НИЗУ СКРИПТА / SETTINGS ARE LOWEST SCRIPT
--==============================================================

--============================ НЕ ТРОГАТЬ / DO NOT TOUCH ==================================
-- upgrade
local upgrade = false
function intUpgrade(upgrade)
	if not upgrade then
		upgrade = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "meth_lab_upgrade")
		DisableInteriorProp(int_id , "meth_lab_setup")	
	else
		upgrade = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "meth_lab_upgrade")
		EnableInteriorProp(int_id , "meth_lab_setup")
	end
end

--basic
local basic = false
function intBasic(basic)
	if not basic then
		basic = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "meth_lab_basic")
		DisableInteriorProp(int_id , "meth_lab_setup")
	else
		basic = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "meth_lab_basic")
		EnableInteriorProp(int_id , "meth_lab_setup")
	end
end

--production
local production = false
function production(production)
	if not production then
		production = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "meth_lab_production")
	else
		production = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "meth_lab_production")
	end
end

--enagble coke upgrate

--securityUpgrade
local securityUpgrade = false
function securityUpgrade(securityUpgrade)
	if not securityUpgrade then
		securityUpgrade = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "meth_lab_security_high")
	else
		securityUpgrade = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "meth_lab_security_high")
	end
end

local empty = false
function empty(empty)
	if not empty then
		empty = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "meth_lab_empty")
	else
		empty = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "meth_lab_empty")
	end
end
--================================================================================



--==========================
--НАСТРОЙКИ / SETTINGS
--==========================

--ru: Меняйте значения false/true в функциях ниже чтобы включить или выключить ipl интерьера
--eng: Change the values of false / true in the functions below to enable or disable the interior ipl

intBasic(false) -- стандартное оборудование / standard equipment
production(true) -- кокаин на 3 столах / cocaine on 3 tables
empty(false) -- всё отключить и включить этот пункт
intUpgrade(true) -- улучшенное оборудование / improved equipment
securityUpgrade(true) -- решетки / gate
