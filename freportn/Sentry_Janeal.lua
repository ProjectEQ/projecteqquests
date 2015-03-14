function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. friend!  Please seek the words of the clerics of Marr.  Their words are the words which will set us free from the tyranny of the Freeport Militia.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12130})) then
		e.self:Say("I feel quite alert now. Thank you. You should take this to the next sentry.");
		e.other:SummonItem(12131);
		e.other:Ding();
		e.other:Faction(258,5,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,5,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
