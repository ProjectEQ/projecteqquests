function event_say(e)
    e.self:Say("Hey, don't bother me right now.  If Grumby sees me talking to you and not working, he will lay into me real good.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end