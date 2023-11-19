function event_say(e)
    e.self:Say("Hello there!  I hope your time on the Queen of Thorns is pleasant.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end