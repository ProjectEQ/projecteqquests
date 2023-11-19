function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Have you seen the Grozmok Stone?  It is actually aboard this ship. Turns out Morden and his crew from long ago got it from the Broken Skull clan of trolls!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end