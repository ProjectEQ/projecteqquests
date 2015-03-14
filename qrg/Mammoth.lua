function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12140})) then
		e.other:SummonItem(18809);
		e.other:Ding();
		e.other:Faction(267, 10,0);
		e.other:Faction(265, 10,0);
		e.other:Faction(159, 10,0);
		e.other:Faction(166, -30,0);
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
