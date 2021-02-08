-- items: 18020, 18025
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18020})) then
		e.self:Say(string.format("Ah, hello there, %s. It's such a fine day out, wouldn't you say? Ah, reports are due in. Very well, here you go. Say hello to the fellows back at the Wind Spirit's Song for me. May you have many safe travels, my friend.",e.other:GetName()));
		e.other:SummonItem(18025); -- Item: Quinon's Report
		e.other:Ding();
		e.other:Faction(284,2,0); -- Faction: League of Antonican Bards
		e.other:Faction(281,2,0); -- Faction: Knights of Truth
		e.other:Faction(262,2,0); -- Faction: Guards of Qeynos
		e.other:Faction(304,-2,0); -- Faction: Ring of Scale
		e.other:Faction(285,-2,0); -- Faction: Mayong Mistmoore
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
