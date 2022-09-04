--===============================
-- by JUST INTERIOR STUDIO
-- Discord UncleJust#0001
--===============================

local int_id = GetInteriorAtCoords(1744.833,-1600.628,112.639)

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
		DisableInteriorProp(int_id , "weed_upgrade_equip")
		DisableInteriorProp(int_id , "light_growtha_stage23_upgrade")
		DisableInteriorProp(int_id , "light_growthb_stage23_upgrade")
		DisableInteriorProp(int_id , "light_growthc_stage23_upgrade")
		DisableInteriorProp(int_id , "light_growthd_stage23_upgrade")
		DisableInteriorProp(int_id , "light_growthe_stage23_upgrade")
		DisableInteriorProp(int_id , "light_growthf_stage23_upgrade")
		DisableInteriorProp(int_id , "light_growthg_stage23_upgrade")
		DisableInteriorProp(int_id , "light_growthh_stage23_upgrade")
		DisableInteriorProp(int_id , "light_growthi_stage23_upgrade")
		
	else
		upgrade = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_upgrade_equip")
		EnableInteriorProp(int_id , "light_growtha_stage23_upgrade")
		EnableInteriorProp(int_id , "light_growthb_stage23_upgrade")
		EnableInteriorProp(int_id , "light_growthc_stage23_upgrade")
		EnableInteriorProp(int_id , "light_growthd_stage23_upgrade")
		EnableInteriorProp(int_id , "light_growthe_stage23_upgrade")
		EnableInteriorProp(int_id , "light_growthf_stage23_upgrade")
		EnableInteriorProp(int_id , "light_growthg_stage23_upgrade")
		EnableInteriorProp(int_id , "light_growthh_stage23_upgrade")
		EnableInteriorProp(int_id , "light_growthi_stage23_upgrade")
	end
end

--basic
local basic = false
function intBasic(basic)
	if not basic then
		basic = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_standard_equip")
		DisableInteriorProp(int_id , "light_growtha_stage23_standard")
		DisableInteriorProp(int_id , "light_growthb_stage23_standard")
		DisableInteriorProp(int_id , "light_growthc_stage23_standard")
		DisableInteriorProp(int_id , "light_growthd_stage23_standard")
		DisableInteriorProp(int_id , "light_growthe_stage23_standard")
		DisableInteriorProp(int_id , "light_growthf_stage23_standard")
		DisableInteriorProp(int_id , "light_growthg_stage23_standard")
		DisableInteriorProp(int_id , "light_growthh_stage23_standard")
		DisableInteriorProp(int_id , "light_growthi_stage23_standard")
	else
		basic = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_standard_equip")
		EnableInteriorProp(int_id , "light_growtha_stage23_standard")
		EnableInteriorProp(int_id , "light_growthb_stage23_standard")
		EnableInteriorProp(int_id , "light_growthc_stage23_standard")
		EnableInteriorProp(int_id , "light_growthd_stage23_standard")
		EnableInteriorProp(int_id , "light_growthe_stage23_standard")
		EnableInteriorProp(int_id , "light_growthf_stage23_standard")
		EnableInteriorProp(int_id , "light_growthg_stage23_standard")
		EnableInteriorProp(int_id , "light_growthh_stage23_standard")
		EnableInteriorProp(int_id , "light_growthi_stage23_standard")
	end
end

--weed Stage1
local weedaStage1 = false
function weedaStage1(weedaStage1)
	if not weedaStage1 then
		weedaStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growtha_stage1")
		DisableInteriorProp(int_id , "weed_hosea")
	else
		weedaStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growtha_stage1")
		EnableInteriorProp(int_id , "weed_hosea")
	end
end
local weedbStage1 = false
function weedbStage1(weedbStage1)
	if not weedbStage1 then
		weedbStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthb_stage1")
		DisableInteriorProp(int_id , "weed_hoseb")
	else
		weedbStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthb_stage1")
		EnableInteriorProp(int_id , "weed_hoseb")
	end
end
local weedcStage1 = false
function weedcStage1(weedcStage1)
	if not weedcStage1 then
		weedcStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthc_stage1")
		DisableInteriorProp(int_id , "weed_hosec")
	else
		weedcStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthc_stage1")
		EnableInteriorProp(int_id , "weed_hosec")
	end
end
local weeddStage1 = false
function weeddStage1(weeddStage1)
	if not weeddStage1 then
		weeddStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthd_stage1")
		DisableInteriorProp(int_id , "weed_hosed")
	else
		weeddStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthd_stage1")
		EnableInteriorProp(int_id , "weed_hosed")
	end
end
local weedeStage1 = false
function weedeStage1(weedeStage1)
	if not weedeStage1 then
		weedeStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthe_stage1")
		DisableInteriorProp(int_id , "weed_hosee")
	else
		weedeStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthe_stage1")
		EnableInteriorProp(int_id , "weed_hosee")
	end
end
local weedfStage1 = false
function weedfStage1(weedfStage1)
	if not weedfStage1 then
		weedfStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthf_stage1")
		DisableInteriorProp(int_id , "weed_hosef")
	else
		weedfStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthf_stage1")
		EnableInteriorProp(int_id , "weed_hosef")
	end
end
local weedgStage1 = false
function weedgStage1(weedgStage1)
	if not weedgStage1 then
		weedgStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthg_stage1")
		DisableInteriorProp(int_id , "weed_hoseg")
	else
		weedgStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthg_stage1")
		EnableInteriorProp(int_id , "weed_hoseg")
	end
end
local weedhStage1 = false
function weedhStage1(weedhStage1)
	if not weedhStage1 then
		weedhStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthh_stage1")
		DisableInteriorProp(int_id , "weed_hoseh")
	else
		weedhStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthh_stage1")
		EnableInteriorProp(int_id , "weed_hoseh")
	end
end
local weediStage1 = false
function weediStage1(weediStage1)
	if not weediStage1 then
		weediStage1 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthi_stage1")
		DisableInteriorProp(int_id , "weed_hosei")
	else
		weediStage1 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthi_stage1")
		EnableInteriorProp(int_id , "weed_hosei")
	end
end

--weed Stage2
local weedaStage2 = false
function weedaStage2(weedaStage2)
	if not weedaStage2 then
		weedaStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growtha_stage2")
		DisableInteriorProp(int_id , "weed_hosea")
	else
		weedaStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growtha_stage2")
		EnableInteriorProp(int_id , "weed_hosea")
	end
end
local weedbStage2 = false
function weedbStage2(weedbStage2)
	if not weedbStage2 then
		weedbStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthb_stage2")
		DisableInteriorProp(int_id , "weed_hoseb")
	else
		weedbStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthb_stage2")
		EnableInteriorProp(int_id , "weed_hoseb")
	end
end
local weedcStage2 = false
function weedcStage2(weedcStage2)
	if not weedcStage2 then
		weedcStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthc_stage2")
		DisableInteriorProp(int_id , "weed_hosec")
	else
		weedcStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthc_stage2")
		EnableInteriorProp(int_id , "weed_hosec")
	end
end
local weeddStage2 = false
function weeddStage2(weeddStage2)
	if not weeddStage2 then
		weeddStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthd_stage2")
		DisableInteriorProp(int_id , "weed_hosed")
	else
		weeddStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthd_stage2")
		EnableInteriorProp(int_id , "weed_hosed")
	end
end
local weedeStage2 = false
function weedeStage2(weedeStage2)
	if not weedeStage2 then
		weedeStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthe_stage2")
		DisableInteriorProp(int_id , "weed_hosee")
	else
		weedeStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthe_stage2")
		EnableInteriorProp(int_id , "weed_hosee")
	end
end
local weedfStage2 = false
function weedfStage2(weedfStage2)
	if not weedfStage2 then
		weedfStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthf_stage2")
		DisableInteriorProp(int_id , "weed_hosef")
	else
		weedfStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthf_stage2")
		EnableInteriorProp(int_id , "weed_hosef")
	end
end
local weedgStage2 = false
function weedgStage2(weedgStage2)
	if not weedgStage2 then
		weedgStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthg_stage2")
		DisableInteriorProp(int_id , "weed_hoseg")
	else
		weedgStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthg_stage2")
		EnableInteriorProp(int_id , "weed_hoseg")
	end
end
local weedhStage2 = false
function weedhStage2(weedhStage2)
	if not weedhStage2 then
		weedhStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthh_stage2")
		DisableInteriorProp(int_id , "weed_hoseh")
	else
		weedhStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthh_stage2")
		EnableInteriorProp(int_id , "weed_hoseh")
	end
end
local weediStage2 = false
function weediStage2(weediStage2)
	if not weediStage2 then
		weediStage2 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthi_stage2")
		DisableInteriorProp(int_id , "weed_hosei")
	else
		weediStage2 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthi_stage2")
		EnableInteriorProp(int_id , "weed_hosei")
	end
end


--weed Stage3
local weedaStage3 = false
function weedaStage3(weedaStage3)
	if not weedaStage3 then
		weedaStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growtha_stage3")
		DisableInteriorProp(int_id , "weed_hosea")
	else
		weedaStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growtha_stage3")
		EnableInteriorProp(int_id , "weed_hosea")
	end
end
local weedbStage3 = false
function weedbStage3(weedbStage3)
	if not weedbStage3 then
		weedbStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthb_stage3")
		DisableInteriorProp(int_id , "weed_hoseb")
	else
		weedbStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthb_stage3")
		EnableInteriorProp(int_id , "weed_hoseb")
	end
end
local weedcStage3 = false
function weedcStage3(weedcStage3)
	if not weedcStage3 then
		weedcStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthc_stage3")
		DisableInteriorProp(int_id , "weed_hosec")
	else
		weedcStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthc_stage3")
		EnableInteriorProp(int_id , "weed_hosec")
	end
end
local weeddStage3 = false
function weeddStage3(weeddStage3)
	if not weeddStage3 then
		weeddStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthd_stage3")
		DisableInteriorProp(int_id , "weed_hosed")
	else
		weeddStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthd_stage3")
		EnableInteriorProp(int_id , "weed_hosed")
	end
end
local weedeStage3 = false
function weedeStage3(weedeStage3)
	if not weedeStage3 then
		weedeStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthe_stage3")
		DisableInteriorProp(int_id , "weed_hosee")
	else
		weedeStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthe_stage3")
		EnableInteriorProp(int_id , "weed_hosee")
	end
end
local weedfStage3 = false
function weedfStage3(weedfStage3)
	if not weedfStage3 then
		weedfStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthf_stage3")
		DisableInteriorProp(int_id , "weed_hosef")
	else
		weedfStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthf_stage3")
		EnableInteriorProp(int_id , "weed_hosef")
	end
end
local weedgStage3 = false
function weedgStage3(weedgStage3)
	if not weedgStage3 then
		weedgStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthg_stage3")
		DisableInteriorProp(int_id , "weed_hoseg")
	else
		weedgStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthg_stage3")
		EnableInteriorProp(int_id , "weed_hoseg")
	end
end
local weedhStage3 = false
function weedhStage3(weedhStage3)
	if not weedhStage3 then
		weedhStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthh_stage3")
		DisableInteriorProp(int_id , "weed_hoseh")
	else
		weedhStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthh_stage3")
		EnableInteriorProp(int_id , "weed_hoseh")
	end
end
local weediStage3 = false
function weediStage3(weediStage3)
	if not weediStage3 then
		weediStage3 = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_growthi_stage3")
		DisableInteriorProp(int_id , "weed_hosei")
	else
		weediStage3 = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_growthi_stage3")
		EnableInteriorProp(int_id , "weed_hosei")
	end
end


local weed_production = false
function weed_production(weed_production)
	if not weed_production then
		weed_production = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_production")
	else
		weed_production = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_production")
	end
end

local weed_set_up = false
function weed_set_up(weed_set_up)
	if not weed_set_up then
		weed_set_up = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_set_up")
	else
		weed_set_up = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_set_up")
	end
end

local weed_drying = false
function weed_drying(weed_drying)
	if not weed_drying then
		weed_drying = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_drying")
	else
		weed_drying = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_drying")
	end
end

local weed_chairs = false
function weed_chairs(weed_chairs)
	if not weed_chairs then
		weed_chairs = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_chairs")
	else
		weed_chairs = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_chairs")
	end
end

--securityBasic
local securityBasic = false
function securityBasic(securityBasic)
	if not securityBasic then
		securityBasic = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_low_security")
	else
		securityBasic = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_low_security")
	end
end

--securityUpgrade
local securityUpgrade = false
function securityUpgrade(securityUpgrade)
	if not securityUpgrade then
		securityUpgrade = false
		RefreshInterior(int_id)
		DisableInteriorProp(int_id , "weed_security_upgrade")
	else
		securityUpgrade = true
		RefreshInterior(int_id)
		EnableInteriorProp(int_id , "weed_security_upgrade")
	end
end

--================================================================================



--==========================
--НАСТРОЙКИ / SETTINGS
--==========================

--ru: Меняйте значения false/true в функциях ниже чтобы включить или выключить ipl интерьера
--eng: Change the values of false / true in the functions below to enable or disable the interior ipl

intBasic(true) -- стандартное освещение / standard light
intUpgrade(true) -- улучшенное освещение / improved light

weedaStage1(false)
weedbStage1(false)
weedcStage1(false)
weeddStage1(false)
weedeStage1(false)
weedfStage1(false)
weedgStage1(false)
weedhStage1(false)
weediStage1(false)

weedaStage2(true)
weedbStage2(true)
weedcStage2(true)
weeddStage2(true)
weedeStage2(true)
weedfStage2(true)
weedgStage2(true)
weedhStage2(true)
weediStage2(true)

weedaStage3(false)
weedbStage3(false)
weedcStage3(false)
weeddStage3(false)
weedeStage3(false)
weedfStage3(false)
weedgStage3(false)
weedhStage3(false)
weediStage3(false)

weed_production(true)
weed_set_up(true)
weed_drying(true)
weed_chairs(true)
securityUpgrade(true)
securityBasic(true)
