-- Private_Nylaen_Kel`Ther (27099)
-- Norraths Keepers Tasks

local don = require("dragons_of_norrath")

-- dialogue uses Say (256) chat type but sent to client only
function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Indifferent) then -- below indifferent
      e.other:Message(MT.Say, ("Private Nylaen Kel`Ther says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    elseif e.other:GetLevel() < 65 then
      e.other:Message(MT.Say, "Private Nylaen Kel`Ther says, 'You certainly appear eager and we do admire that so, but you are far too young to take on the difficult tasks I require.'")
    else
      -- live doesn't appear to check faction or level outside of the early checks, just flags
      if player:has_flag(don.flags.t1.said_help) and not player:has_flag(don.flags.t1.solo_quests_hail) then
        player:assign_quests(player.solo_quests.t1)
      elseif player:has_flag(don.flags.t2.said_work) and not player:has_flag(don.flags.t2.solo_quests_hail) then
        player:assign_quests(player.solo_quests.t2)
      elseif player:has_flag(don.flags.t3.hail_start) and not player:has_flag(don.flags.t3.solo_quests_hail) then
        player:assign_quests(player.solo_quests.t3)
      end

      e.other:Message(MT.Say, "Private Nylaen Kel`Ther says, 'We all have the opportunity to rise to greatness with Norrath's Keepers and our honorable allies across the lands.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
