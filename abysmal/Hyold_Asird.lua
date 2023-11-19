function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Some of us might be considered ruffians or scoundrels back on Antonica, but the Wayfarers Brotherhood welcomes us to its ranks.  Morden Rasp is the most amazing Norrathian I've ever met.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end