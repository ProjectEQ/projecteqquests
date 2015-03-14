function event_waypoint_arrive(e)
	if(e.wp == 2 or e.wp == 5) then
		eq.set_anim(4072,1);
	elseif(e.wp == 3) then
		eq.set_anim(4072,0);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18921})) then -- Message to Konem
		e.self:Say("Oh I see.. Phin's always after me about something.  I mean, it's not my fault the order hasn't come in yet.  Hey, since I'm so busy right now, why don't you be a friend and take this back to Phin for me, huh?");
		e.other:SummonItem(18922); -- Grathin's Invoice
		e.other:Ding();
		e.other:Faction(300,2,0); -- Silent Fist Clan
		e.other:Faction(135,2,0); -- Guards of Qeynos
		e.other:Faction(12,2,0); -- Ashen Order
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
