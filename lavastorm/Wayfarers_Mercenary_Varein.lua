-- Wayfarers_Mercenary_Varein (27084)
-- Alliance Tasks

local don = require("dragons_of_norrath")

local tasks = {
  5065, -- Blood Money
  5061, -- Spider's Webs
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Indifferent) then -- only offered up to apprehensive
      e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Varein says, 'Feeling a bit like an outsider? I certainly understand that as part of the brotherhood, though I don't envy you. We've been able to make a good bit o' coin off the Dark Reign.  Give us a hand and I'll see about helping you get inside.'")
      eq.task_selector(tasks) -- note: unknown condition on live where only one task is offered sometimes
    else
      e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Varein says, 'I managed to have a chat with the Dark Reign and they did mention they are looking for recruits. They might listen to you.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
