function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  I heard someone went ashore the other day and got eaten by a giant crab.  I am happy right here working for Grumby even if he is a bit stern sometimes.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end