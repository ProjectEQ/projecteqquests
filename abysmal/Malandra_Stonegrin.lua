function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Apparently this new continent has seen much tribulation.  I hear that a gate to another world appeared here and very powerful creatures poured through it, killing and enslaving the native peoples. Sounds like make-believe to me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end