-- define some basic inventory items

local items = {}

local function play_eat(player)
  local seq = {
    {"mp_player_inteat@burger", "mp_player_int_eat_burger_enter",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_burger",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_exit_burger",1}
  }

  vRPclient._playAnim(player,true,seq,false)
end

local function play_drink(player)
  local seq = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient._playAnim(player,true,seq,false)
end

-- gen food choices as genfunc
-- idname
-- ftype: eat or drink
-- vary_hunger
-- vary_thirst
local function gen(ftype, vary_hunger, vary_thirst)
  local fgen = function(args)
    local idname = args[1]
    local choices = {}
    local act = "Unknown"
    if ftype == "eat" then act = "Comer" elseif ftype == "drink" then act = "Beber" end
    local name = vRP.getItemName(idname)

    choices[act] = {function(player,choice)
      local user_id = vRP.getUserId(player)
      if user_id ~= nil then
        if vRP.tryGetInventoryItem(user_id,idname,1,false) then
          if vary_hunger ~= 0 then vRP.varyHunger(user_id,vary_hunger) end
          if vary_thirst ~= 0 then vRP.varyThirst(user_id,vary_thirst) end

          if ftype == "drink" then
            vRPclient._notify(player,"~b~ Bebendo "..name..".")
            play_drink(player)
          elseif ftype == "eat" then
            vRPclient._notify(player,"~o~ Comendo "..name..".")
            play_eat(player)
          end

          vRP.closeMenu(player)
        end
      end
    end}

    return choices
  end

  return fgen
end

-- DRINKS --

items["water"] = {"Garrafa de água","", gen("drink",0,-25),0.05}
items["milk"] = {"Leite","", gen("drink",0,-5),0.05}
items["coca_cola"] = {"Coca Cola","Coca Cola Geladinha", gen("drink",0,-22),0.01}
items["coffee"] = {"Café","", gen("drink",0,-10),0.02}
items["tea"] = {"Chá","", gen("drink",0,-15),0.02}
items["icetea"] = {"Chá Gelado","", gen("drink",0,-20), 0.05}
items["orangejuice"] = {"Suco de Laranjas","", gen("drink",0,-25),0.05}
items["redbull"] = {"Red Bull","", gen("drink",0,-40),0.03}
items["lemonlimonad"] = {"Limonada","", gen("drink",0,-45),0.03}
items["maccocacola"] = {"Mac Coca Cola","", gen("drink",0,-40),0.03}
items["macfanta"] = {"Mac Fanta","", gen("drink",0,-40),0.03}
--items["vodka"] = {"Vodka","", gen("drink",15,-65),0.05}
--items["cerveja"] = {"Cerveja","Beba com Moderação", gen("drink",0,-40),0.03}

--FOOD

-- create Breed item
items["bread"] = {"Pão","", gen("eat",-10,0),0.05}
items["donut"] = {"Rosquinha","", gen("eat",-15,0),0.02}
items["pizza"] = {"Pizza","Pizzas Saborosas", gen("eat",-22,0),0.01}
items["tacos"] = {"Churrasco","", gen("eat",-20,0),0.02}
items["kebab"] = {"Kebab","", gen("eat",-45,0),0.05}
items["bigmac"] = {"Big Mac","", gen("eat",-40,0),0.05}
items["quarterao"] = {"Mac Quarterao","", gen("eat",-40,0),0.05}
items["banana"] = {"Banana","So no Bananao", gen("eat",-10,0),0.02}
items["croquete"] = {"Croquete","", gen("eat",-10,0),0.05}

return items
