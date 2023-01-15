-- Wayfarers_Mercenary_Elanye (27082)
-- Alliance Tasks

local don = require("dragons_of_norrath")

local tasks = {
  5064, -- Blood of the Winged
  5062, -- Goblin Broth
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Indifferent) then -- only offered up to apprehensive
      e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Elanye says, 'I'm not that interested in becoming a servant of those followers of Firiona Vie myself, but I don't mind the cash they pay me. I keep most for me and throw a little back to the Wayfarers crew. If you're looking to get on their good side, I can make some money and you can gain their audience.'")
      eq.task_selector(tasks) -- note: unknown condition on live where only one task is offered sometimes
    else
      e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Elanye says, 'I've gotten acquainted with Norrath's Keepers well enough to know they might be interested in speaking with you.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
