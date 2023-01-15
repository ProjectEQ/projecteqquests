-- items: 20015, 1717
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh my word!! A rescuer!! Hurry! Get me out of these chains!! Go find the orc who has the keys!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {copper = 1})) then
		e.self:Say("No, no!! I do not need this!! Get me key number 15!!");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20015})) then
		e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
		e.other:Ding();
		e.other:Faction(333,1,0); -- Faction: King Ak`Anon
		e.other:Faction(245,1,0); -- Faction: Eldritch Collective
		e.other:Faction(255,1,0); -- Faction: Gem Choppers
		e.other:Faction(239,-2,0); -- Faction: The Dead
		e.other:AddEXP(1000);
		e.other:GiveCash(0,7,3,0);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1717})) then
		e.self:Say("Ah! A letter from my brother! Mmm... no... no I don't have Tergon's spellbook. The orc's prophet took it and then they locked me in chains! Now why don't you go do something useful and get me key number 15!!");
		e.other:Faction(333,1,0); -- Faction: King Ak`Anon
		e.other:Faction(245,1,0); -- Faction: Eldritch Collective
		e.other:Faction(255,1,0); -- Faction: Gem Choppers
		e.other:Faction(239,-2,0); -- Faction: The Dead
		e.other:AddEXP(500);
		eq.depop_with_timer();		
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Retlon Benclog
