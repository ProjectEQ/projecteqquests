function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello!  Fresh baked goods are the best way to cheer up a friend.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end