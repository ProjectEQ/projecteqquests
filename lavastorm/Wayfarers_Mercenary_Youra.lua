-- Wayfarers_Mercenary_Youra (27080)
-- Norrath Keepers Token Turnin

local don = require("dragons_of_norrath")

function event_say(e)
  if e.message:findi("hail") then
    e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Youra says, 'You might say me and my brother are adept at, uhm, convincing those we chose. Norrath's Keepers are quite fond of me in particular and have been searching for their tokens and they pay me well for them.  Should you find one, give one to me and I will sing your praises to the followers of Firiona Vie.'")
  end
end

function event_trade(e)
  local item_lib = require("items")
  if item_lib.check_turn_in(e.trade, {item1 = 57208}) then -- Norrath's Keepers Token
    -- note: on live this is Say channel (256) but only sent to client (similar to NPCQuestSay)
    e.other:Message(MT.Say, "Wayfarers Mercenary Youra says, 'Ah, yes, on my next visit I will tell tales of how you helped the Keepers further the cause of the balance of good and evil!'")
    e.other:QuestReward(e.self, { faction = { don.faction_id.norraths_keepers, 20 } })
    don.remove_invalid_aa(e.other, don.faction_id.dark_reign)
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
