function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hail.  Don't let Dunttas bend your ear too much.  He means well, and he's sincere, but he will talk forever about [mending our ways] if you let him.");
    elseif e.message:findi("mending our ways") then
        e.self:Say("I suppose I could give you the entire litany, I've heard it often enough.  Are you a devout follower of a god?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end