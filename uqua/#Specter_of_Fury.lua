function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 67706}) then -- Item: Orb of Fury
		eq.zone_emote(15,"The Specter of Fury gives a slight bow as it accepts the orb.");
		eq.signal(292008,1)
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
