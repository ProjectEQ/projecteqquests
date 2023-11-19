function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I guess this new continent's name is Taelosia.  That's what I heard some adventurers calling it anyway.  That big city up on the hills is called Nihilia and its people are called 'nihil.'  They seem a sad, broken people.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end