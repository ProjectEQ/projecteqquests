function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There are No greater circles of magic than those of the Teir'Dal.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end