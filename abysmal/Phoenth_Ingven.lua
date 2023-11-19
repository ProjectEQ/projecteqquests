function event_say(e)
    e.self:Say("Hello!  Come on over here!  I have plenty of scrolls for you to see.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end