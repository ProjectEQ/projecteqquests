function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("There are those that dismiss the importance of what is going on here.  Do I believe the end of Norrath is here?  Well, all I can say is I hope not.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end