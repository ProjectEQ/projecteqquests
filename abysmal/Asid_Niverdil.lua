function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("To be honest, the Grozmok Stone kinda freaks me out.  I mean look at how it just floats there.  It is my job to guard it however.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end