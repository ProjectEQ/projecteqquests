function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, welcome, welcome! This is the Emporium. If we don't have it, we can get it!!");
	elseif(e.message:findi("boat beacon")) then
		e.self:Say("What!!? Looking for a boat beacon? We may be getting one from Ak'Anon in about a year. You can always try to make one. Find a greater lightstone, a metal disk and a copper band. If you have a beacon mount, go to a forge and combine them all. It's not that hard, but it's not that easy, either.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end