-- Officer_Sirrikis_Ryktor (27096)
-- Dark Reign Tasks

local don = require("dragons_of_norrath")

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Indifferent) then -- below indifferent
      e.other:Message(MT.Say, "Officer Sirrikis Ryktor says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    elseif e.other:GetLevel() < 65 then
      e.other:Message(MT.Say, "Officer Sirrikis Ryktor says, 'Your skill and experience suggests you are barely qualified to polish my boots! Begone from my sight, foolish weakling!  Should you ever grow up, then maybe I'll look in your direction again.'")
    else
      if player:has_flag(don.flags.t1.said_help) and not player:has_flag(don.flags.t1.solo_quests_hail) then
        player:assign_quests(player.solo_quests.t1)
      elseif player:has_flag(don.flags.t2.said_work) and not player:has_flag(don.flags.t2.solo_quests_hail) then
        player:assign_quests(player.solo_quests.t2)
      elseif player:has_flag(don.flags.t3.hail_start) and not player:has_flag(don.flags.t3.solo_quests_hail) then
        player:assign_quests(player.solo_quests.t3)
      end
      e.other:Message(MT.Say, "Officer Sirrikis Ryktor says, 'Perhaps you will find a path to the higher ranks of the Dark Reign -- a place I'm sure I shall find myself someday... someday.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
