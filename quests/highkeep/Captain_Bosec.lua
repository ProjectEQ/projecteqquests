function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm Captain Bosec. and I am the officer in charge down here. It's my job to patrol the prison and try to keep any [goblins] from getting into Highpass.");
	end
end

function event_trade(e)
	local ear = 0;
	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13790,item2 = 13790,item3 = 13790,item4 = 13790})) then
			ear = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13790,item2 = 13790,item3 = 13790})) then
			ear = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13790,item2 = 13790})) then
			ear = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13790})) then
			ear = 1;
	end
	
	if(ear > 0) then
		repeat
			e.self:Say("Well done! We could really use the extra help around here.");
			e.other:Ding();
			e.other:Faction(149,4,0);
			e.other:Faction(31,4,0);
			e.other:Faction(214,4,0);
			e.other:Faction(53,4,0);
			e.other:Faction(105,4,0);
			e.other:AddEXP(100);
			e.other:GiveCash(3,3,4,0);
			ear = ear - 1;
		until ear == 0
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
