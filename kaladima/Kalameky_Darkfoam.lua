function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18906})) then
		e.self:Say("Why, that..! Bah! Fine. Stupid as a newborn gob. He's not gonna get this, then. Hey, you might as well take it. It was gonna be his reward fer a job well done.");
		e.other:QuestReward(e.self,0,0,0,0,23359,30000); -- Item: Targ Shield
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
