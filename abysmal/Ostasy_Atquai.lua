function event_say(e)
    e.self:Say("Hopefully your coin purse is full, my friend.  I have many items that you need, but they are not cheap.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end