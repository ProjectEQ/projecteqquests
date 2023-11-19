function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Okay, let's see... that's two... five to the fifth power... huh?  Oh sorry. I was just making some calculations for replacement stones for the magical buoys.  What?  Oh, don't worry, they're not failing, but I would like to have replacements ready just in case.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end