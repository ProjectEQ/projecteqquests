function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello, ".. e.other:GetName() .. ".  I hope I can provide you with what you desire.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end