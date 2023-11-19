function event_say(e)
    e.self:Say("My back is killing me.  Grumby makes us work too much.  I am sick of lifting crates all day.  Uh oh.  Grumby is looking this way.  You better go.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end