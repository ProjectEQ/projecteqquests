function event_say(e)
    e.self:Say("My husband, Fernan snores so loudly that I cannot get any sleep,' Gleria sighs.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end