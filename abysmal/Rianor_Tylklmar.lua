function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("There are reports coming back from adventurers that other-worldly creatures have invaded Norrath and enslaved the people of this continent.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end