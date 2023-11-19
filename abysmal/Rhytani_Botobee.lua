function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello there. Do you know anything about magic? I don't understand how it is that those small stones out there keep that horrible darkness at bay. It bothers me to see that darkness out there with nothing holding it back but some small rocks and some magic. I keep my eyes open for [trouble] nonetheless!");
	elseif e.message:findi("trouble") then
		e.self:Say("Those barriers only keep out the darkness, not whatever might live in it! So we have to keep our eyes on the sea to make certain that nothing tries to get onto the ship. If you see anything, make sure to let us know right away!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end