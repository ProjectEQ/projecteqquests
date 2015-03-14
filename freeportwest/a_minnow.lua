function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13861})) then
		e.self:Emote("darts into the jar, or just darted past it!! The Knights of Truth do not tolerate people attempting to catch these fish!!");
		e.other:SummonItem(eq.ChooseRandom(13861,13862));
		e.other:Ding();
		e.other:Faction(184,-2,0);
		e.other:Faction(86,1,0);
		e.other:Faction(105,1,0);
		e.other:Faction(258,-2,0);
		e.other:Faction(311,-2,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
