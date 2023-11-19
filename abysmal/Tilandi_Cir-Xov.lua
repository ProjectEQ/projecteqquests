function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I don't like it one bit.  Don't like what?  Having that Grozmok Stone aboard the ship, that's what.  It really creeps me out.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end