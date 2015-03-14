function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please seek guidance from the clerics within this temple.  I am but a Sentry of Passion and my duty is to protect this temple.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12128})) then
		e.self:Say("Ahhh!! That has given me back lost energy. Thank you. Please take this to the next sentry.");
		e.other:SummonItem(12129);
		e.other:Ding();
		e.other:Faction(258,5,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,5,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
