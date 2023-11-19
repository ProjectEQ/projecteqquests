function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Some say that the end of the world is near.  I don't believe that, but I do think that our world is about to change.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end