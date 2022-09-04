
--===============================

local int_id = GetInteriorAtCoords(-536.798,-1786.4524,21.609)



--============================ НЕ ТРОГАТЬ / DO NOT TOUCH ==================================
-- upgrade
local upgrade = false
function intUpgrade(upgrade)
	if not upgrade then
		upgrade = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "set_up")
		DisableInteriorProp(int_id , "equipment_upgrade")
		DisableInteriorProp(int_id , "coke_press_upgrade")
		DisableInteriorProp(int_id , "production_upgrade")
		DisableInteriorProp(int_id , "table_equipment_upgrade")		
	else
		upgrade = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "set_up")
		EnableInteriorProp(int_id , "equipment_upgrade")
		EnableInteriorProp(int_id , "coke_press_upgrade")
		EnableInteriorProp(int_id , "production_upgrade")
		EnableInteriorProp(int_id , "table_equipment_upgrade")
		EnableInteriorProp(int_id , "security_high")
	end
end

--basic
local basic = false
function intBasic(basic)
	if not basic then
		basic = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "set_up")
		DisableInteriorProp(int_id , "equipment_basic")
		DisableInteriorProp(int_id , "coke_press_basic")
		DisableInteriorProp(int_id , "production_basic")
		DisableInteriorProp(int_id , "table_equipment")
	else
		basic = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "set_up")
		EnableInteriorProp(int_id , "equipment_basic")
		EnableInteriorProp(int_id , "coke_press_basic")
		EnableInteriorProp(int_id , "production_basic")
		EnableInteriorProp(int_id , "table_equipment")
	end
end

--enagle coke basic
local basicCoke = false
function basicCoke(basicCoke)
	if not basicCoke then
		basicCoke = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "coke_cut_01")
		DisableInteriorProp(int_id , "coke_cut_02")
		DisableInteriorProp(int_id , "coke_cut_03")	
	else
		basicCoke = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "coke_cut_01")
		EnableInteriorProp(int_id , "coke_cut_02")
		EnableInteriorProp(int_id , "coke_cut_03")
	end
end

--enagble coke upgrate
local updateCoke = false
function updateCoke(updateCoke)
	if not updateCoke then
		updateCoke = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "coke_cut_04")
		DisableInteriorProp(int_id , "coke_cut_05")		
	else
		updateCoke = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "coke_cut_04")
		EnableInteriorProp(int_id , "coke_cut_05")
	end
end

--securityBasic
local securityBasic = false
function securityBasic(securityBasic)
	if not securityBasic then
		securityBasic = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "security_low")
	else
		securityBasic = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "security_low")
	end
end

--securityUpgrade
local securityUpgrade = false
function securityUpgrade(securityUpgrade)
	if not securityUpgrade then
		securityUpgrade = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "security_high")
	else
		securityUpgrade = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "security_high")
	end
end
--================================================================================


intBasic(false) -- стандартное оборудование / standard equipment
securityBasic(false) -- пропы у входа / props at the entrance
basicCoke(false) -- кокаин на 3 столах / cocaine on 3 tables

intUpgrade(true) -- улучшенное оборудование / improved equipment
updateCoke(true) -- кокаин на 5 столах / cocaine on 5 tables
securityUpgrade(true) -- решетки / gate
