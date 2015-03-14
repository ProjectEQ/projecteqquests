count = 0;

function event_spawn(e)
	eq.set_timer("shout",17000);
end

function event_timer(e)
	if(e.timer == "shout") then
		count = count + 1;
	end
	
	if(count) then
		e.self:Shout("Grrrraaaaarrrrrg! The stench of fear permeates the walls of this city! I will forge one item for the faithful of our Lord Cazic-Thule! Make haste!  My time here is short!");
	end
	
	if(count == 10) then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 14105})) then
		e.self:Say("Wear this shield imbued with my very essence. Wear it in honor of your great services to our Lord Cazic-Thule!");
		e.other:SummonItem(14107);
		e.other:Ding();
		e.other:Faction(143,50,0);
		e.other:Faction(79,-50,0);
		e.other:Faction(112,-50,0);
		e.other:Faction(56,-50,0);
		e.other:Faction(60,-50,0);
		e.other:AddEXP(1000);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
