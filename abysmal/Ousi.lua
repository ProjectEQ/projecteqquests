function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("You better stock up on weapons and magic before you leave here.  There's no telling what kind of supplies you may or may not be able to find once you leave to explore the new land.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end