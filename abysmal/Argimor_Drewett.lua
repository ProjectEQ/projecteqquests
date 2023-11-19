function event_say(e)
    e.self:Say("We have arrived safely on the shores of the new continent, but there is much work to be done.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end