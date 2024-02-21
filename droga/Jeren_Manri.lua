-- part of pok quest The Magic Pool.  in both prevamp and revamp.

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Shhh, be quiet! The goblins may hear you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 15959})) then
		e.self:Emote("Oh! Thank you, I assume this means that Thiran sent you. I ran off with the incorrect book without thinking to check. Would you be kind enough to return this to him?");
		e.other:QuestReward(e.self,{itemid = 15960}); --The Reflecting Pools of Tanaan
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
