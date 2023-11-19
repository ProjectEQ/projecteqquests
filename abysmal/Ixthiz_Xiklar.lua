function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Not all of the natives of this land are friendly toward us.  There is a group of twisted Taelosians in the mountains that are quite hostile.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end