function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Welcome aboard the Queen of Thorns!  We have space upstairs if you need to rest.  I also have items for sale if you need supplies.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end