function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Aagggh..  Get away from here..  Go, run..  Far away..  Or I shall call [Karana's] wrath upon you!");
	elseif(e.message:findi("karana")) then
		e.self:Say("Heh!..  Ignorant one!  Begone, and take your stupidity with you!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13072})) then
		e.self:Say("Ahh yes..  These are a little small, but still some good eating, if you know how to cook 'em of course..   Here ya go, enjoy and may Karana keep your fields lush and green.");
		e.other:SummonItem(13719);
		e.other:Ding();
		e.other:Faction(11,2,0); -- Arcane Scientists
		e.other:Faction(184,2,0); -- Knights of Truth
		e.other:Faction(105,-3,0); -- Freeport Militia
		e.other:Faction(235,-3,0); -- Opal Dark Briar
		e.other:AddEXP(200);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13719})) then
		e.self:Say("Wha?..   Ah, I guess it's a bit of an acquired taste..  Oh well, your loss..  Here, take this..  They ain't no ears, but it's the least I could do..   And if ya find any more rat ears, good ol' Rephas here will be glad to take 'em off your hands for ya!");
		e.other:SummonItem(13076);
		e.other:Ding();
		e.other:Faction(11,2,0); -- Arcane Scientists
		e.other:Faction(184,2,0); -- Knights of Truth
		e.other:Faction(105,-3,0); -- Freeport Militia
		e.other:Faction(235,-3,0); -- Opal Dark Briar
		e.other:AddEXP(200);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13050,item2 = 13050,item3 = 13050,item4 = 13050})) then
		e.self:Say("Wow!..  How big was the dang varmint that these come off of?!  Bigger'n a ol' grizzly, I bet!  You've earned this, my friend!  It's my own secret recipe for rat ear pie..  sure is tasty, easy to make, and keeps your belly full while you're running about in the hills and such.  Take care, and may Karana keep your path clear and our lakes full.");
		e.other:SummonItem(18103);
		e.other:Ding();
		e.other:Faction(11,8,0); -- Arcane Scientists
		e.other:Faction(184,8,0); -- Knights of Truth
		e.other:Faction(105,-12,0); -- Freeport Militia
		e.other:Faction(235,-12,0); -- Opal Dark Briar
		e.other:AddEXP(200);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13050})) then
		e.self:Say("Hey..  wow..  Now THESE are some good, meaty ears..  These will make one great rat ear pie..  Tell ya what, kid..  bring me a few more o' these beauties, and I'll give you my secret recipe for cooking 'em.");
		e.other:Ding();
		e.other:Faction(11,2,0); -- Arcane Scientists
		e.other:Faction(184,2,0); -- Knights of Truth
		e.other:Faction(105,-3,0); -- Freeport Militia
		e.other:Faction(235,-3,0); -- Opal Dark Briar
		e.other:AddEXP(50);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 27428,item2 = 27429,item3 = 27430})) then
		e.self:Say("Ah! You've found them! I hope those gnolls payed dearly for stealing them from me. Did they beg for mercy? I sure hope so. Well, here is the completed research book for Juegile.");
		e.other:SummonItem(27431);
		e.other:Ding();
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

