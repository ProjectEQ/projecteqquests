function event_say(e)
    e.self:Say("I have all sorts of spells available.  You are welcome to take a look.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end