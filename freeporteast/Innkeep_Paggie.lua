function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello there %s! You'll be happy to see that I am fully stocked with all my usual goods. Have a look around.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end