-- items: 29845
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("ZZZzzzzzzzzzzz");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 29845}, 0)) then -- Field Orders
		e.self:Say("Huh? What? Oh, umm, let's see here... OK I best get these taken care of right away. Thank you.");
		e.other:Faction(1503,1);  -- +Validus Custodus 
		e.other:Faction(1502,1);  -- +Katta Castellum Citizens
		e.other:Faction(1504,1);  -- +Magus Conlegium
		e.other:Faction(1505,-1); -- -Nathyn Illuminious
		e.other:Faction(1506,-1);  -- -Coterie of the Eternal Night
		e.other:Faction(1483,-1); -- -Seru
		e.other:Faction(1484,-1); -- -Hand of Seru
		e.other:Faction(1485,-1);  -- -Eye of Seru
		e.other:Faction(1541,-1); -- -Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.spawn2(160433,30,0,-2107,99,33,0); --#Legionnaire_Claudius (160433)
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
