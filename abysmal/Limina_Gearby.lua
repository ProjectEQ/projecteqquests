function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("The Abysmal Sea is so hostile that I am surprised we made it here.  This ship truly is a testament to the skills of the Wayfarers Brotherhood.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end