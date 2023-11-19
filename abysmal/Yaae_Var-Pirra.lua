-- Yaae_Var`Pirra

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("What an amazing time to be alive, my friend.  First the discovery of lost dungeons and now a new continent!  Yes, a most exciting time indeed!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end