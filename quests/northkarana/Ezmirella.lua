-- Part of quest for Incandescent Wand

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 6338, gold = 50})) then -- text are made up
		e.self:Say("I have done everything in my power to enchant this wand, but I fear it is not enough.  Take the wand to Raine Beteria in Erudin; she should be able to finish its enchantments.  Do not forget to pay her for the service, as you did me.");
		e.other:SummonItem(6339);
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414 / converted to lua by robregen
