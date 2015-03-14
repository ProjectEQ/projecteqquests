function event_spawn(e)
	eq.set_timer("depop", 1800000);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	eq.signal(6186,0);
	eq.signal(6187,0);
	eq.stop_timer("depop");
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.signal(6186,0);
		eq.signal(6187,0);		
		eq.depop();
	end
end
