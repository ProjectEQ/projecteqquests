function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Isn't it funny how some of the Wayfarers Brotherhood are so different? So special?  I have to wonder if they were brought together by some kind of force or something.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end