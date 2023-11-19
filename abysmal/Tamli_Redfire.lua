function event_say(e)
    e.self:Say("I am here to guard these chests.  What's in em you ask?  Don't ask, don't tell is my policy.  Now beat it.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end