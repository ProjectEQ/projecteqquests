function event_say(e)
    e.self:Say("Cawen has been having a hard time lately.  She woke up screaming from a bad dream last night.  I hope she will be ok.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end