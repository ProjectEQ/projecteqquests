local is_dark_reign = false
local dark_reign_task_ids = { [4812] = true, [4813] = true, [4814] = true } -- Dark Reign mission versions
local delivered_plans = false

local function player_loot(e)
  if e.corpse:IsNPCCorpse() and e.item:GetID() == 36214 then -- Temple Plans
    if is_dark_reign then
      eq.unique_spawn(338422, 0, 0, -307.0, 955.0, 43.0, 134.0) -- Dark_Reign_Contact
    else
      eq.unique_spawn(338420, 0, 0, -250.0, 435.0, -8.0, 88.0)  -- Norrath`s_Keeper_contact
    end
  end
end

local function contact_trade(e)
  local item_lib = require("items")
  if not delivered_plans and item_lib.check_turn_in(e.trade, { item1 = 36214 }) then -- Temple Plans
    local contact
    if is_dark_reign then
      contact = eq.unique_spawn(338420, 0, 0, -250.0, 435.0, -8.0, 88.0) -- Norrath`s_Keeper_contact
      eq.spawn2(338427, 0, 0, -222.0, 434.0, -1.0, 105.0) -- a_Stillmoon_follower
      eq.spawn2(338427, 0, 0, -240.0, 476.0, -7.0, 138.0) -- a_Stillmoon_follower
    else
      contact = eq.unique_spawn(338422, 0, 0, -307, 955, 43, 134) -- Dark_Reign_Contact
      eq.spawn2(338421, 0, 0, -247, 989, 43, 330) -- Dark_Reign_assistant
      eq.spawn2(338421, 0, 0, -248, 918, 43, 437) -- Dark_Reign_assistant
    end
    contact:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
    contact:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
    delivered_plans = true
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

function event_encounter_load(e)
  is_dark_reign = dark_reign_task_ids[eq.get_dz_task_id()]
  eq.debug("Using Dark Reign version: " .. tostring(is_dark_reign))
  eq.register_npc_event(Event.trade, 338422, contact_trade) -- Dark_Reign_Contact
  eq.register_npc_event(Event.trade, 338420, contact_trade) -- Norrath`s_Keeper_contact
  eq.register_player_event(Event.loot, player_loot)
end
