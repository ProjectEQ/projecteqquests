function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hi there.  I'm here to guard these crates and barrels.  Nothing too important in them. Froak. Just some grains and [fresh water].");
	elseif e.message:findi("fresh water") then
		e.self:Say("Fresh water is a little hard to come by here, but our supplies are at acceptable levels for now. Froak.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end