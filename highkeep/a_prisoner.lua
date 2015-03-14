function event_say(e)
	if(e.message:findi("fenn kaedrick")) then
		e.self:Say("The dungeon is located on the lower levels of Highkeep. Do not venture there. It is off limits to visitors. If you wish to get someone released, you will have to speak with the jail clerk just before you get to the dungeon.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end