function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello there!  Oh I was just cleanin' me axes.  I had to teach some critters a lesson today!  You come for some trainin'?  You came to the right man, me friend!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
