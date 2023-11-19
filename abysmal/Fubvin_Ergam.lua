function event_say(e)
    e.self:Say("I wish someone would quiet down that darn dwarf in the next room over.  I cannot get any rest with his incessant babbling!");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end