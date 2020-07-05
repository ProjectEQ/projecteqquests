-- items: 13790
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm Captain Bosec. and I am the officer in charge down here. It's my job to patrol the prison and try to keep any [goblins] from getting into Highpass.");
	elseif(e.message:findi("goblin")) then
		e.self:Say("Help us exterminate these vile creatures. They call themselves the [Pickclaw] Clan.. I call them annoying. I will gladly pay big money for the left ear of every goblin slain.");
	elseif(e.message:findi("pickclaw")) then
		e.self:Say("A couple of months ago, Carson decided to add some more floors beneath the keep. During the construction, we came across these tunnels.. and these goblins. Work has been temporarily halted until we can completely clear out this Pickclaw infestation.");
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
			e.other:Faction(332,2,0); -- Faction: Highpass Guards
			e.other:Faction(329,1,0); -- Faction: Carson McCabe
			e.other:Faction(331,1,0); -- Faction: Merchants of Highpass
			e.other:Faction(230,1,0); -- Faction: Corrupt Qeynos Guards
			e.other:Faction(330,1,0); -- Faction: The Freeport Militia
			e.other:AddEXP(30);
			e.other:GiveCash(3,3,4,0);
			ear = ear - 1;
		until ear == 0
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
