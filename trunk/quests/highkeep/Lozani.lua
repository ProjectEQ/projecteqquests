function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. friend!!  I am Lozani. Scribe Supreme of the Eldritch Collective.  I have been sent forth from the great Library of Mechanimagica in the city of Ak'Anon. to study the arcane knowledge of man and beast alike.  I have studied many languages and spells. from Crushbone to Kerra Ridge.  I have found most languages hard to decipher.  As of this date. I have learned to read only the script of the [orc oracles].  Oh well. I am on a five decade mission.  Better luck next language.");
	elseif(e.message:findi("orc oracles")) then
		e.self:Say("I have been studing there scrolls and cantrips. Currently though I am out of ones to study. If you bring me back a scroll or two cantrips I might be able to reward your efforts.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local scroll = 0;

	if(item_lib.check_turn_in(e.trade, {item1 = 13225})) then -- Illegible Scroll
		e.self:Say("I managed to decipher this one.");
		scroll = 1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13845,item2 = 13845})) then -- Illegible Cantrip
		e.self:Say("I managed to decipher these.");
		scroll = 1;
	end
	if(scroll == 1) then
		e.other:SummonItem(eq.ChooseRandom(15200, 15042, 15226, 13360, 15246, 15276));
		e.other:Ding();
		e.other:Faction(115,5,0); -- Gem Choppers
		e.other:Faction(176,5,0); -- King AkAnon
		e.other:Faction(210,5,0); -- Merchants of AkAnon
		e.other:Faction(71,-5,0); -- Dark Reflection
		e.other:Faction(322,-5,0); -- The Dead
		e.other:AddEXP(100);
		scroll = 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
