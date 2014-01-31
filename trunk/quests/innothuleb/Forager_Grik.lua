function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Grikk.. Please leave me be. I but a humble forager. My people are starving.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13375})) then
		e.self:Say("Grrrikk.. This is Groak's vial!! He must be in danger. Here. Return this liquid to him. Be quick!");
		e.other:SummonItem(13376);
		e.other:Ding();
		e.other:Faction(106,20,0);
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
