function event_say(e)
    e.self:Say("Sing me a song!  It's been a while since I've heard a fresh voice.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end