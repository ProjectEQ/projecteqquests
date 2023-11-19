function event_say(e)
    e.self:Say("I have many dark magics for sale, if you are worthy.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end