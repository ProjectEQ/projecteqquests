-- Evil Research
-- The xp from this quest was what made it worthwhile, more than the concordance. -Kilelen
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Tv`ysa, guardian of the [Concordance of Research].");
	elseif(e.message:findi("Concordance of Research")) then
		e.self:Say("The 'Concordance of Research' is an aid to those who follow the path of academia. It, and its sister books, 'Runes and Research', volumes I and II, help those who are [interested] in researching spells.");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have several copies of each book. If you want a copy of 'Runes and Research', volume I or II, bring me a lightstone and I will give you whichever book I have more of at the moment. Bring me a greater lightstone, and I will give you a copy of the 'Concordance of Research.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10300})) then -- Lightstone
		e.self:Say("A lightstone ? Thank you very much. Here is a copy of 'Runes and Research' for you.");
		e.other:Ding();
		e.other:SummonItem(eq.ChooseRandom(18175, 18176)); -- Runes and Research Volume I or II
		e.other:Faction(87,10,0); -- Dreadguard Inner
		e.other:Faction(88,10,0); -- Dreadguard Outer
		e.other:Faction(69,10,0); -- Dark Bargainers
		e.other:AddEXP(137200); -- 5% level 15 experience.
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 10400})) then -- Greater Lightstone
		e.self:Say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
		e.other:Ding();
		e.other:SummonItem(17504); -- Concordance of Research
		e.other:Faction(87,10,0); -- Dreadguard Inner
		e.other:Faction(88,10,0); -- Dreadguard Outer
		e.other:Faction(69,10,0); -- Dark Bargainers
		e.other:AddEXP(274400); -- 10% level 15 experience.
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
