function event_say(e)
    e.self:Say("Ah, I see you've found me.  I know we're a bit out of the way down here, but we like it quiet.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end