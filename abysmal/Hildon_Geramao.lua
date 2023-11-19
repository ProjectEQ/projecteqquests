function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("These Muramites are fierce indeed and I fear for Norrath. We must prepare for battle.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end