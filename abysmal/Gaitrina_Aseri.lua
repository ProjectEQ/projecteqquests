function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello. I am afraid that we have no more horses to sell. These all belong to members of the brotherhood.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end