function event_say(e)
    e.self:Say("These crates were supposed to contain supplies to help repair the hull, but they contain grain.  Grumby is going to be very angry.  What should I do?");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end