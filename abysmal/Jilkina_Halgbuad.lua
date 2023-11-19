function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I feel very uneasy here.  This place feels sinister.  Can you not feel it?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end