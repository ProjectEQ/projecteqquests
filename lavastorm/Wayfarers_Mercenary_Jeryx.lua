-- Wayfarers_Mercenary_Jeryx (27083)
-- Alliance Tasks

local don = require("dragons_of_norrath")

local tasks = {
  5067, -- Taunting the Brood
  5063, -- Meat for Stew
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Indifferent) then -- only offered up to apprehensive
      e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Jeryx says, 'So, you want to get in good with them dark crusaders, eh? I might be able to help you. If you run a few errands for me, I can probably put in a good word.'")
      eq.task_selector(tasks) -- note: unknown condition on live where only one task is offered sometimes
    else
      e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Jeryx says, 'You can probably go try to speak to the Dark Reign for work.  I've got nothing for you.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
