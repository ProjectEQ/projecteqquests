-- Part of quest for Incandescent Wand
-- items: 6338, 6339
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. I am Ezmirella.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 6338, gold = 50})) then
		e.self:Say("I have blessed your silver wand.  To complete the enchantment, you must take the wand to Raine Beteria in the Erudin Library.  Tip her 50 golden coins, and she will help you.");
		e.other:SummonItem(6339); -- Item: Blessed Silver Wand
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414 / converted to lua by robregen
