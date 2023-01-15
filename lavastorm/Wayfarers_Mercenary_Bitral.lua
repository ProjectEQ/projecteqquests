-- Wayfarers_Mercenary_Bitral (27081)
-- Alliance Tasks

local don = require("dragons_of_norrath")

local tasks = {
  5066, -- Population Control
  5060, -- Gathering Silk
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Indifferent) then -- only offered up to apprehensive
      e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Bitral says, 'Hm, you seem the sort that might benefit from an association with Norrath's Keepers.  It can't be all bad being on the side of Firiona Vie. I don't much care myself, they just pay me for my work -- not all of it is noble.'")
      eq.task_selector(tasks) -- note: unknown condition on live where only one task is offered sometimes
    else
      e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Bitral says, 'I understand your desire to win the hearts of Norrath's Keepers.  I'm sure they'd be happy to talk with you.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
