function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail %s. Business is going well these days. I have a full stock of baked goods and other items for sale. Have a look around!",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end