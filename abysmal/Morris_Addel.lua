function event_say(e)
    e.self:Say("There is no better value to be found aboard this ship than right here.  Please, friend, look through my wares and you will see that I speak the truth.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end