function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Excuse me, but you should not be down in the pens.  There are very dangerous creatures kept here.  For the gladiator games, you know.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
