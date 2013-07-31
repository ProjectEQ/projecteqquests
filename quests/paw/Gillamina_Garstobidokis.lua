--NPC: Gillamina Garstobidokis
--
--Quest: Gillamina's Elemental Research (Incomplete)
--
-- To Do: When paws switch to elemental zone
-- Add level check
-- Add Gillamina Garstobidokis
-- Add Blazemaster Arnab
-- Add Earthmaster Grundag
-- Add Tidemaster Aquinius
-- Add Windlord Brizoris

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you, fellow adventurer. Gillamina Garstobidokis, master mage at your service!");
		e.self:Emote("bows.");
		e.self:Say("Beware, should you wish to venture here. In case you didn't know, the lair of Splitpaw has been overrun by fierce elemental creatures.");
		e.self:Emote("looks down at the dead gnoll near her feet.");
		e.self:Say("Poor creatures. I am not a fan of the gnolls by any means, but it is still sad to see them all [slaughtered] in this manner.");
	elseif(e.message:findi("slaughtered")) then
		e.self:Say("Yes, the gnolls that once laired here have been destroyed by the elementals it seems. I am not quite sure what happened. These elementals intrigue me so. But I suppose you would like to know what I am [doing here]?");
	elseif(e.message:findi("doing here")) then
		e.self:Say("Good question! I have come here looking for a set of unique orbs that contain the essence of the various elementals that have invaded the lair. If you can find four of these orbs, one from a fire elemental, one from an air elemental, one from an earth elemental, and one from a water elemental, I will gladly repay you for your time. I wish to study these orbs and have not had much luck finding any unfortunately.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 55995,item2 = 55993,item3 = 55992,item4 = 55994})) then -- Air Elemental Orb, Earthen Elemental Orb, Fiery Elemental Orb, Watery Elemental Orb
		e.self:Say("Remarkable! I cannot wait to study these! Here is your reward as promised! Safe travels.");
		e.other:SummonItem(71271); -- Elemental Stone
		e.other:Ding();
		e.other:AddEXP(5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
