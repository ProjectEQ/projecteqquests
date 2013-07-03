function event_say(e)
	if(e.message:findi("nice hat")) then
		e.self:Say(string.format("Thank you, It is worn with pride and is the symbol of the Rivervale Militia"));
	end
end

function event_trade(e)
	local item_lib = require("item_turnin");
	item_lib.return_items(e.self, e.other, e.trade)
end