-- items: 12128, 12129
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please seek guidance from the clerics within this temple.  I am but a Sentry of Passion and my duty is to protect this temple.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12128})) then
		e.self:Say("Ahhh!! That has given me back lost energy. Thank you. Please take this to the next sentry.");
		e.other:SummonItem(12129); -- Item: Part of Potion of Marr
		e.other:Ding();
		e.other:Faction(362,5,0); -- Faction: Priests of Marr
		e.other:Faction(330,-10,0); -- Faction: The Freeport Militia
		e.other:Faction(281,5,0); -- Faction: Knights of Truth
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
