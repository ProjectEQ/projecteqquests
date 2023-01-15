-- Wayfarers_Mercenary_Limann (27079)
-- Dark Reign Token Turnin

local don = require("dragons_of_norrath")

function event_say(e)
  if e.message:findi("hail") then
    e.other:Message(MT.NPCQuestSay, "Wayfarers Mercenary Limann says, 'Me and me sister have got a great thing going here.  We easily can play both sides of the fence with these camps and earn a good amount of coin. As long as neither knows we are relations, we can continue this forever! I've been bringing tokens of the Dark Reign to them and they seem to enjoy getting them, and pay us fairly well.  So, if you give me one, I will be able to spin a tale that will put you in a favorable light.'")
  end
end

function event_trade(e)
  local item_lib = require("items")
  if item_lib.check_turn_in(e.trade, {item1 = 57209}) then -- Dark Reign Token
    -- note: on live this is Say channel (256) but only sent to client (similar to NPCQuestSay)
    e.other:Message(MT.Say, "Wayfarers Mercenary Limann says, 'You can be sure the Dark Reign will hear how you have run through an enemy and I might even spice it up and suggest you bested a Keeper.  Oh, how they will like that!'")
    e.other:QuestReward(e.self, { faction = { don.faction_id.dark_reign, 20 } })
    don.remove_invalid_aa(e.other, don.faction_id.norraths_keepers)
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
