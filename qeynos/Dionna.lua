function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13708})) then -- Note From Fabian
		e.self:Say("Ah, well, Fabian said to give you this. It really is a good piece. Good luck!");
		e.other:SummonItem(85059); -- Cloak of Hazy Memories
		e.other:Ding();
		e.other:Faction(284, 5,0); -- Faction: League of Antonican Bards
		e.other:Faction(281, 5,0); -- Faction: Knights of Truth
		e.other:Faction(262, 5,0); -- Faction: Guards of Qeynos
		e.other:Faction(304, -5,0); -- Faction: Ring of Scale
		e.other:Faction(285, -5,0); -- Faction: Mayong Mistmoore
		e.other:AddEXP(5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
