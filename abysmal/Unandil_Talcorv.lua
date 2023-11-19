function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  I have a bad feeling about being here.  Maybe I just miss being home with my family.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end