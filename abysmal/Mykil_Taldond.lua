function event_say(e)
    e.self:Say("Go away.  I have a lot of work to do.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end