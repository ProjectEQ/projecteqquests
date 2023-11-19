function event_spawn(e)
	eq.set_timer("Flavor", 5 * 60 * 1000); -- 5 Minutes
end

function event_timer(e)
	if e.timer == "Flavor" then
		e.self:Emote("moans pitifully,  'Satchel... Sewers...'");
	end
	eq.stop_timer(e.timer)
end

function event_say(e)
    e.self:Emote("moans in a sad, wispy voice. 'Death... coming for all...");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end