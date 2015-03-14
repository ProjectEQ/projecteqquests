function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please speak with the masters. I am on watch and have no time to converse.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12132})) then
		e.self:Say("That gives me new life. Take it to the next sentry.");
		e.other:SummonItem(12133);
		e.other:Ding();
		e.other:Faction(258,5,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,5,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
