function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I seem to be missing a tome.  Did I lend it to somebody?  Did somebody take it?  Do you know where it is?  What should I do!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end