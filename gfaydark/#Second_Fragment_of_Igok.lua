-- items: 63128
function event_say(e)
	if (e.message:findi("hail")) then
		if (e.other:HasItem(63118)) then
			e.self:Say("Oh . .yes yes. Good good.");
			e.other:SummonItem(63128); -- Second Igok Fragment
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	item_lib.return_items(e.self, e.other, e.trade);
end