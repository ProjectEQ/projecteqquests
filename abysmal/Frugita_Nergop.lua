function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hey, what is wrong with you?  You always just barge into people's rooms?  Get out of here!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end