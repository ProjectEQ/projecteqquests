function event_say(e)
    e.self:Say("We do our very best to keep all the items you might need in stock.  However, there are several specialty merchants nearby if we do not have what you seek.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end