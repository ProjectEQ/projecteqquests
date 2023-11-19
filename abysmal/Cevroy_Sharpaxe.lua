function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I overheard a group of adventurers talking about the creatures on this continent.  They say they are very powerful and unlike anything ever seen before.  I would advise extreme caution if you plan to leave the ship.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end