function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("They say that the magical buoys will protect us from danger.  I don't feel so confident, though.  One cannot trust magic alone.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end