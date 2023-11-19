function event_say(e)
    e.self:Say("Hail!  It's my honor to assist you.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end