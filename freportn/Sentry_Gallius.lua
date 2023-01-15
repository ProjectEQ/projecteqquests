-- items: 12129, 12130
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I welcome you to the Temple of Marr. home to clerics of the deities Erollisi and Mithaniel Marr.  Please seek guidance from the clerics.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12129})) then
		e.self:Say("Excellent!! I feel quite refreshed with but a sip. You may take this to the next sentry.");
		e.other:SummonItem(12130); -- Item: Part of Potion of Marr
		e.other:Ding();
		e.other:Faction(362,5,0); -- Faction: Priests of Marr
		e.other:Faction(330,-10,0); -- Faction: The Freeport Militia
		e.other:Faction(281,5,0); -- Faction: Knights of Truth
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
