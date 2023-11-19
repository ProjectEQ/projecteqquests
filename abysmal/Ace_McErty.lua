function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hey, don't talk to me while I am on this ladder!  I am afraid of heights!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end