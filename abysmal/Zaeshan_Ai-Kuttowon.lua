function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Yeah?  What do you want?  You want information? I met one of the natives here.  Strange lookin', but nice I suppose.  She seemed sad.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end