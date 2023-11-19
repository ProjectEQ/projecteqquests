function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("The Wayfarers Brotherhood is amassing trustworthy adventures to explore this new continent.  I hear a great danger has come here and that it could destroy the Taelosians if we do nothing to help.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end