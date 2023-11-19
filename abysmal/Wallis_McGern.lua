function event_say(e)
    e.self:Say("I thought I could handle being a sailor, but to be honest, I feel very sick right now.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end