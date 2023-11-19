function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Have you met Grumby?  He seems like a mean fellow, but he really isn't that bad when you get to know him.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end