function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello, ".. e.other:GetName() .. ". I'd say it's a lovely day, but I think I may just be feeling better than everyone else. Have a look around if you know what you're looking for.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end