-- Officer_Vacax_Rol`Tas (27095)
-- Dark Reign Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 4986, min_faction = don.faction.Warmly,      flag = don.flags.t5.hail_start },       -- Rival Party [68+]
  { task_id = 5015, min_faction = don.faction.Indifferent, flag = don.flags.t1.solo_quests_hail }, -- Have Note Will Travel [65+]
  { task_id = 4771, min_faction = don.faction.HighAmiable, flag = don.flags.t3.solo_quests_hail }, -- The Gilded Scroll
  { task_id = 5555, min_faction = don.faction.Amiable,     flag = don.flags.t2.solo_quests_hail }, -- Drake Eggs [68+]
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, "Officer Vacax Rol`Tas says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    elseif e.other:GetLevel() < 65 then
      e.other:Message(MT.Say, "Officer Vacax Rol`Tas says, 'Your skill and experience suggests you are barely qualified to polish my boots! Begone from my sight, foolish weakling!  Should you ever grow up, then maybe I'll look in your direction again.'")
    else
      e.other:Message(MT.Say, "Officer Vacax Rol`Tas laughs, 'These are indeed good days for the will of hate and fear. We will overcome the races of light and prevail. Pledge allegiance to Lanys T`Vyl!'")
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
