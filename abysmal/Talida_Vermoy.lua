function event_say(e)
    e.self:Say("Grumby over there is in charge of the maintenance department.  It is best if you do not disturb him.  He is very busy.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end