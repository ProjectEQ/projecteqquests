function event_say(e)
    e.self:Say("We've come this far into the darkness, there's no turning back.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end