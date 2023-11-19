function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I didn't think that they would be able to build such a ship as this, but they pulled it off.  I am amazed.  It is really a work of art.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end