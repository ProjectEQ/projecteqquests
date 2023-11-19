function event_say(e)
    e.self:Say("Hmm.  I don't think this ladder is gonna be tall enough.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end