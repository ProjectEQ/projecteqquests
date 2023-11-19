function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Why are all you people coming into my room?  I can't even get any sleep!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end