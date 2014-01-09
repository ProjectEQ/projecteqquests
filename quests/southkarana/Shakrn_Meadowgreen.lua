-- warrior crafted armor
-- generic reward text - could only find the correct text for the bracer
-- updated the original file with correct text and used the handin plugin

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. I am Shakrn Meadowgreen, Warrior extraordinaire and Master Armorer of the Meadowgreen family. My brother and I craft [armor] for the bravest warriors in the land -- do you think you [qualify]?");
	elseif(e.message:findi("armor")) then
		e.self:Say("I smith [Helms], [Gauntlets], [Boots] and [Vambraces]. My brother Ulan smiths Bracers, Greaves, Pauldruns and Breastplates.");
	elseif(e.message:findi("qualify")) then
		e.self:Say("So you are a warrior of renown?  [Prove] it to me and I will smith you [armor] befitting your exalted station.");
	elseif(e.message:findi("prove")) then
		e.self:Say("You will prove yourself to me the old fashioned way, by killing things and bringing me back proof of your deed.  Bah.  What other way is there?");
	elseif(e.message:findi("helm")) then
		e.self:Say("One of my brethren spoke to me of the mystic properties of the Fire Totems carried by the Goblin High Shaman in Solusek's Eye. My mighty Centaur body will not fit down those twisty goblin passages, so I have not been able to acquire one on my own. As proof of your powers, I ask you to bring me a Fire Totem and one [Ruby] stone. Do so and I will reward you with a Crafted Helmet.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("Crafted Gauntlets - the mark of a distinguished warrior. I have a personal grudge to settle with those twice-cursed Aviaks. They have been raiding our merchant convoys for the last few weeks, causing mischief to no end. Bring me an Aviak charm from a Avocet - I am sure that you will not need me to tell you how to get it. An Aviak Charm and two [Star Rubies], and I will reward you with Crafted Gauntlets.");
	elseif(e.message:findi("boots")) then
		e.self:Say("One of my brethren spoke to me of the mystic properties of the Frost Totems carried by the Goblin High Shamans in Permafrost Keep. I have been unable to fetch one for myself, as my Centaur's body will not fit through the tunnels of those sniveling wretches. Prove your might by gifting me a Frost Totem and two [Sapphire] stones. Do this and I will reward you with a pair of Crafted Boots.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("Come, Warrior, and speak to me of your strength. Bring me the Eye of a Griffon that I might eat it raw in the fashion of my ancestors. Do this for me - then gift me with two [Fire Emeralds], and for you I will make a Crafted Vambrace.");
	elseif(e.message:findi("ruby")) then
		e.self:Say("I need a ruby for a piece of jewelry my brother and I are creating.");
	elseif(e.message:findi("star rubies")) then
		e.self:Say("I need a star ruby for a piece of jewelry my brother and I are creating.");
	elseif(e.message:findi("fire emerald")) then
		e.self:Say("i need a fire emerald for a piece of jewelry my brother and I are creating.");
	elseif(e.message:findi("sapphire")) then
		e.self:Say("I need a sapphire for a piece of jewelry my brother and I are creating");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13743,item2 = 10035})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(4173);
		e.other:Ding();
		e.other:AddEXP(25000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13737,item2 = 10032,item3 = 10032})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(4178);
		e.other:Ding();
		e.other:AddEXP(25000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13744,item2 = 10034,item3 = 10034})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(4180);
		e.other:Ding();
		e.other:AddEXP(25000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13739,item2 = 10033,item3 = 10033})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(4176);
		e.other:Ding();
		e.other:AddEXP(25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: southkarana ID: 14075 NPC: Shakrn_Meadowgreen

