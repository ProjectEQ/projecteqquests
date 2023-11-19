function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  Yes, this is the fabled Grozmok Stone.  You may look but please don't touch.  I guard this relic with my life.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end