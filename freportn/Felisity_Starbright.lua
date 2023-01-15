-- items: 18158, 18157, 18159, 18155
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail. %s - If you are interested in helping the League of Antonican Bards by delivering some mail you should talk to Ton Twostring.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18158}) or item_lib.check_turn_in(e.trade, {item1 = 18157})) then
		e.self:Say("Incoming mail - very good!  Please take this gold for your troubles.");
		e.other:Ding();
		e.other:Faction(284,5,0); -- league of antonican bards
		e.other:Faction(281,1,0); -- knights of truth
		e.other:Faction(262,1,0); -- guards of qeynos
		e.other:Faction(304,-1,0); -- ring of scale
		e.other:Faction(285,-1,0); -- mayong mistmoore
		e.other:AddEXP(1550);
		e.other:GiveCash(0,0,eq.ChooseRandom(6,7,8,9),0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18159})) then
		e.self:Say("Incoming mail - very good!  Please take this gold for your troubles.");
		e.other:Ding();
		e.other:Faction(284,5,0); -- league of antonican bards
		e.other:Faction(281,1,0); -- knights of truth
		e.other:Faction(262,1,0); -- guards of qeynos
		e.other:Faction(304,-1,0); -- ring of scale
		e.other:Faction(285,-1,0); -- mayong mistmoore
		e.other:AddEXP(1550);
		e.other:GiveCash(0,0,eq.ChooseRandom(8,9,10,11,12),0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18155})) then
		e.self:Say("Incoming mail - very good!  Please take this gold for your troubles.");
		e.other:Ding();
		e.other:Faction(284,5,0); -- league of antonican bards
		e.other:Faction(281,1,0); -- knights of truth
		e.other:Faction(262,1,0); -- guards of qeynos
		e.other:Faction(304,-1,0); -- ring of scale
		e.other:Faction(285,-1,0); -- mayong mistmoore
		e.other:AddEXP(1550);
		e.other:GiveCash(0,0,eq.ChooseRandom(11,12,13,14,15),0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
