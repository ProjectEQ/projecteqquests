-- items: 18150, 18151, 18153, 18154
function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to my wife, Eve.",e.other:GetName()));
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = (18150 or 18151)})) then
		local random_gold = math.random(6);
		e.self:Say("Incoming mail - very good! Please take this gold for your troubles.");
		e.other:Ding();
		e.other:Faction(284,5,0); -- Faction: League of Antonican Bards
		e.other:Faction(281,1,0); -- Faction: Knights of Truth
		e.other:Faction(262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(285,-1,0); -- Faction: Mayong Mistmoore
		e.other:AddEXP(1550);
		e.other:GiveCash(0,0,random_gold,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = (18153 or 18154)})) then
		local random_gold = math.random(12);
		e.self:Say("Incoming mail - very good! Please take this gold for your troubles.");
		e.other:Ding();
		e.other:Faction(284,5,0); -- Faction: League of Antonican Bards
		e.other:Faction(281,1,0); -- Faction: Knights of Truth
		e.other:Faction(262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(285,-1,0); -- Faction: Mayong Mistmoore
		e.other:AddEXP(1550);
		e.other:GiveCash(0,0,random_gold,0);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end
