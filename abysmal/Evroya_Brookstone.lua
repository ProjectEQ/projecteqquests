function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("If you are planning on leaving the ship, make sure you are fully armed with weapons and or magic.  There is much danger in these lands.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end