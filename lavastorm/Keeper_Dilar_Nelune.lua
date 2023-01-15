-- Keeper_Dilar_Nelune (27100)
-- Norrath's Keepers Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 4991, min_faction = don.faction.Warmly,      flag = don.flags.t5.hail_start },       -- Origins of the Curse
  { task_id = 401,  min_faction = don.faction.Indifferent, flag = don.flags.t1.solo_quests_hail }, -- Children of Gimblax [68+]
  { task_id = 4785, min_faction = don.faction.Amiable,     flag = don.flags.t2.solo_quests_hail }, -- Sickness of the Spirit [68+]
  { task_id = 4799, min_faction = don.faction.HighAmiable, flag = don.flags.t3.solo_quests_hail }, -- History of the Isle
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, ("Keeper Dilar Nelune says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    elseif e.other:GetLevel() < 65 then
      e.other:Message(MT.Say, "Keeper Dilar Nelune says, 'You certainly appear eager and we do admire that so, but you are far too young to take on the difficult tasks I require.'")
    else
      e.other:Message(MT.Say, "Keeper Dilar Nelune says, 'Should we all perform to Chieftain Aderi's expectations, the races of good and light will bring an end to the threat of evil upon Norrath.'")
      local task_offers = don.get_filtered_tasks(player, missions)
      if #task_offers == 0 then -- eqstr id 8940 (source-based custom selector filters not implemented)
        e.other:Message(MT.Red, "Your group does not meet the requirements for any available shared tasks.")
      else
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
