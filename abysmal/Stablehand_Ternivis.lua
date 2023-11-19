function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("These drogmors are very ill. They didn't do so well on the trip over.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end