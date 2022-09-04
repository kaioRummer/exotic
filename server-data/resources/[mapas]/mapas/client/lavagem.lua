
--===============================

local int_id = GetInteriorAtCoords(1049.7860,-1908.1245,31.3918)

-- upgrade
local upgrade = false
function intUpgrade(upgrade)
	if not upgrade then
		upgrade = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_upgrade_equip")	
	else
		upgrade = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_upgrade_equip")
	end
end

local intUpgradeNoProd = false
function intUpgradeNoProd(intUpgradeNoProd)
	if not intUpgradeNoProd then
		intUpgradeNoProd = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_upgrade_equip_no_prod")	
	else
		intUpgradeNoProd = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_upgrade_equip_no_prod")
	end
end

--basic
local basic = false
function intBasic(basic)
	if not basic then
		basic = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_standard_equip")
	else
		basic = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_standard_equip")
	end
end

local intBasicNoProd = false
function intBasicNoProd(intBasicNoProd)
	if not intBasicNoProd then
		intBasicNoProd = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_standard_equip_no_prod")
	else
		intBasicNoProd = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_standard_equip_no_prod")
	end
end




--dryer on
local dryera_on = false
function dryera_on(dryera_on)
	if not dryera_on then
		dryera_on = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryera_on")
	else
		dryera_on = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryera_on")
	end
end
local dryerb_on = false
function dryerb_on(dryerb_on)
	if not dryerb_on then
		dryerb_on = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerb_on")
	else
		dryerb_on = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerb_on")
	end
end
local dryerc_on = false
function dryerc_on(dryerc_on)
	if not dryerc_on then
		dryerc_on = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerc_on")
	else
		dryerc_on = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerc_on")
	end
end
local dryerd_on = false
function dryerd_on(dryerd_on)
	if not dryerd_on then
		dryerd_on = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerd_on")
	else
		dryerd_on = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerd_on")
	end
end




--dryer open
local dryera_open = false
function dryera_open(dryera_open)
	if not dryera_open then
		dryera_open = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryera_open")
	else
		dryera_open = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryera_open")
	end
end
local dryerb_open = false
function dryerb_open(dryerb_open)
	if not dryerb_open then
		dryerb_open = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerb_open")
	else
		dryerb_open = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerb_open")
	end
end
local dryerc_open = false
function dryerc_open(dryerc_open)
	if not dryerc_open then
		dryerc_open = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerc_open")
	else
		dryerc_open = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerc_open")
	end
end
local dryerd_open = false
function dryerd_open(dryerd_open)
	if not dryerd_open then
		dryerd_open = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerd_open")
	else
		dryerd_open = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerd_open")
	end
end




--dryer off
local dryera_off = false
function dryera_off(dryera_off)
	if not dryera_off then
		dryera_off = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryera_off")
	else
		dryera_off = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryera_off")
	end
end
local dryerb_off = false
function dryerb_off(dryerb_off)
	if not dryerb_off then
		dryerb_off = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerb_off")
	else
		dryerb_off = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerb_off")
	end
end
local dryerc_off = false
function dryerc_off(dryerc_off)
	if not dryerc_off then
		dryerc_off = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerc_off")
	else
		dryerc_off = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerc_off")
	end
end
local dryerd_off = false
function dryerd_off(dryerd_off)
	if not dryerd_off then
		dryerd_off = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "dryerd_off")
	else
		dryerd_off = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "dryerd_off")
	end
end

--cash
local cash10 = false
function cash10(cash10)
	if not cash10 then
		cash10 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_cashpile10a")
		DisableInteriorProp(int_id , "counterfeit_cashpile10c")
		DisableInteriorProp(int_id , "counterfeit_cashpile10b")
		DisableInteriorProp(int_id , "counterfeit_cashpile10d")
	else
		cash10 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_cashpile10a")
		EnableInteriorProp(int_id , "counterfeit_cashpile10c")
		EnableInteriorProp(int_id , "counterfeit_cashpile10b")
		EnableInteriorProp(int_id , "counterfeit_cashpile10d")
	end
end
local cash20 = false
function cash20(cash20)
	if not cash20 then
		cash20 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_cashpile20a")
		DisableInteriorProp(int_id , "counterfeit_cashpile20b")
		DisableInteriorProp(int_id , "counterfeit_cashpile20c")
		DisableInteriorProp(int_id , "counterfeit_cashpile20d")
	else
		cash20 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_cashpile20a")
		EnableInteriorProp(int_id , "counterfeit_cashpile20b")
		EnableInteriorProp(int_id , "counterfeit_cashpile20c")
		EnableInteriorProp(int_id , "counterfeit_cashpile20d")
	end
end
local cash100 = false
function cash100(cash100)
	if not cash100 then
		cash100 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_cashpile100a")
		DisableInteriorProp(int_id , "counterfeit_cashpile100b")
		DisableInteriorProp(int_id , "counterfeit_cashpile100c")
		DisableInteriorProp(int_id , "counterfeit_cashpile100d")
	else
		cash100 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_cashpile100a")
		EnableInteriorProp(int_id , "counterfeit_cashpile100b")
		EnableInteriorProp(int_id , "counterfeit_cashpile100c")
		EnableInteriorProp(int_id , "counterfeit_cashpile100d")
	end
end

--securityBasic
local special_chairs = false
function special_chairs(special_chairs)
	if not special_chairs then
		special_chairs = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "special_chairs")
	else
		special_chairs = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "special_chairs")
	end
end

local money_cutter = false
function money_cutter(money_cutter)
	if not money_cutter then
		money_cutter = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "money_cutter")
	else
		money_cutter = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "money_cutter")
	end
end
local counterfeit_setup = false
function counterfeit_setup(counterfeit_setup)
	if not counterfeit_setup then
		counterfeit_setup = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_setup")
	else
		counterfeit_setup = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_setup")
	end
end

--securityBasic
local securityBasic = false
function securityBasic(securityBasic)
	if not securityBasic then
		securityBasic = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_low_security")
	else
		securityBasic = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_low_security")
	end
end

--securityUpgrade
local securityUpgrade = false
function securityUpgrade(securityUpgrade)
	if not securityUpgrade then
		securityUpgrade = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "counterfeit_security")
	else
		securityUpgrade = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "counterfeit_security")
	end
end

intUpgrade(true) 
intUpgradeNoProd(false) 
intBasic(false) 
intBasicNoProd(false) 

dryera_on(true) 
dryerb_on(true) 
dryerc_on(false) 
dryerd_on(false) 

dryera_open(false) 
dryerb_open(false) 
dryerc_open(true) 
dryerd_open(false)

dryera_off(false) 
dryerb_off(false) 
dryerc_off(false) 
dryerd_off(true)

cash10(false) 
cash20(false) 
cash100(true) 

securityBasic(true) 
securityUpgrade(true) 

special_chairs(true)
money_cutter(true)
counterfeit_setup(true)
