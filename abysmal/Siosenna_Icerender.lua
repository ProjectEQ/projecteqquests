function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  I am one of the navigators that helped sail the Queen of Thorns here.  We sailed blindly with only the guidance of the Grozmok Stone.  The stone was floating and pointing us in this direction!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end