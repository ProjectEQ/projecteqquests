function event_say(e)
    e.self:Say("Welcome.  May you always have grass under your feet and the sun at your back.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end