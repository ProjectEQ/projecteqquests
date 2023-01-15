function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_death(e)
	if(math.random(100) < 75) then
		e.self:CastSpell(1017, e.other:GetID());                -- fishnova
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end
