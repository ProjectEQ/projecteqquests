function event_say(e)
    e.self:Say("Greetings, traveler.  Tunare watch over you.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end