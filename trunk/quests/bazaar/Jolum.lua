function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! Nice to see ya, friend. I've got a fine selection of spankin' good spells, perhaps you'd be interested? Or maybe you'd like to learn how to [upgrade] your Grandmaster Trade items? Still yet, maybe you would like to know how to create a [Grandmaster's Medicine Bag]?");

	elseif(e.message:findi("upgrade")) then
		e.self:Say("What Grandmaster Trade item would you like to know how to upgrade? I can tell you how to upgrade your [Grandmaster Baker's Spoon], [Grandmaster Brewer's Corker], [Grandmaster Fletcher's Knife], [Grandmaster Jeweler's Eyeglass], [Grandmaster Potter's Sculpter], [Grandmaster Smith's Hammer], [Grandmaster Tailor's Needle], or your [Grandmaster Tinker's Spanner]. While you can't have more than one of the new items, they will summon a [bag] for you. Very useful for carrying heavy items about and such.");

	elseif(e.message:findi("bag")) then
		e.self:Say("Its a very sturdy bag, but I'm afraid that it's only temporary. If you'd like to get a more permanent bag, just hand me your summoned one and I'll trade it out you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 17900})) then	--Grandmaster's Satchel
		e.self:Say("Here's a more permanent bag.");				--Text made up, no reference
		e.other:Ding();
		e.other:SummonItem(17138);								--Grandmaster's Carry-all
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
