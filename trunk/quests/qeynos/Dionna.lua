function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13708})) then -- Note From Fabian
		e.self:Say("Ah, well, Fabian said to give you this. It really is a good piece. Good luck!");
		e.other:SummonItem(85059); -- Cloak of Hazy Memories
		e.other:Ding();
		e.other:Faction(192, 5,0);
		e.other:Faction(184, 5,0);
		e.other:Faction(135, 5,0);
		e.other:Faction(273, -5,0);
		e.other:Faction(207, -5,0);
		e.other:AddEXP(5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end