function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hey now, don't you go gettin' any foolish thoughts in your head.  We have mindreaders aboard and they will surely know what you're up to.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end