function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hail to you as well.  Have you been to the new continent yet?  I hear it looks like it was wracked by a huge earthquake.  What could have caused that?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end