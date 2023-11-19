function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hail.  With all of the hard work we're doing, it's difficult to keep needed supplies in stock.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end