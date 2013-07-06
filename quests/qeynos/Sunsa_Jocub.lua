function event_signal(e)
	e.self:Say("Trumpy, you are one sick little man!");
	eq.signal(1042,1);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
