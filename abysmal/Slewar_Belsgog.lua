function event_say(e)
    e.self:Say("Froak! May the Lightbearer greet you when you awaken, and may Truth guide your heart.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end