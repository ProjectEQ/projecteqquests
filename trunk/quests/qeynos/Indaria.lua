function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, have you seen my daughter?");
	elseif(e.message:findi("daughter")) then
		e.self:Say("Yes, my daughter. She went to play near the aqueducts with her doll and now she is gone. If only there was some sign of her..");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13712})) then
		e.self:Emote("tries to keep her composure. She hands you a silver locket with great effort, and then bursts into tears.");
		e.other:SummonItem(1316);
		e.other:Ding();
		e.other:Faction(135,10,0);
		e.other:Faction(9,10,0);
		e.other:Faction(53,-20,0);
		e.other:Faction(33,-20,0);
		e.other:Faction(217,10,0);
		e.other:AddEXP(27440);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
