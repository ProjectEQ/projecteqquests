function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Okay too busy to talk.  Okay still got lots of [stuff] to move.");
	elseif e.message:findi("stuff") then
		e.self:Say("Round stuff, square stuff...  stuff Grumby say to move.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end