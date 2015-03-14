function event_spawn(e)
	eq.set_timer("daydream",2700000);
end

function event_timer(e)
	e.self:Emote("seems oblivious to the outside world. He stares into the water, chuckling every so often, as he drops in some sort of pebble that hisses for a moment on impact. His robes seem faded, tattered, and caked in dirt. A slight green shimmer surrounds his body.");
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20695})) then
		e.self:Emote("grabs the heart as you toss it to him before realizing what it is. As soon as it touches his hands, his body convulses, a sickly light emanating from his eyes and oozing cracks appear in his skin. As he melts into the ground, a small glowing ball floats where he once stood.");
		e.other:SummonItem(20698);
		e.other:Ding();
		e.other:AddEXP(2000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
