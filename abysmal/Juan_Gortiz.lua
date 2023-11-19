function event_say(e)
    e.self:Say("Amazing ship, wouldn't you say?  Don't get me wrong.  I am honored to be aboard, but I miss seeing the sky sometimes.  All you can see from the deck is that strange force field.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end