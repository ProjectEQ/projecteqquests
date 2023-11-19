function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("My attempts to help Nedaria have made her worse.  I have sent a scout to tell Morden and Tondal to return as soon as possible.  I don't know what to do now.  I... have failed my... dearest friends.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end