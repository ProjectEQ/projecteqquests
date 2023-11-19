function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hey, don't you try to get me recruited into that adventuring nonsense.  I came aboard to work and work only.  Now scram!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end