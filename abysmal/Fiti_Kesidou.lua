function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("It is good to see so many adventurers aboard our ship. I just pray to Tunare for everyone's safety.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end