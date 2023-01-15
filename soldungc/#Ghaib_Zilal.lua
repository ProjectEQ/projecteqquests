-- Quest: Aid Ghaib Against the Kobolds  
-- items: 55260, 55253, 55254, 55255, 55256, 55257, 55258, 55259

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if(e.message:findi("Hail")) then
		e.self:Say("Quiet, fool. The pathetic kobolds know not of my presence and I'd like to keep it that way. Though, I was hoping someone with your strength would come along. I am in need of your [" .. eq.say_link("aid") .. "].");
	elseif(e.message:findi("aid")) then
		e.self:Say("I've infiltrated this, the latest stronghold of the servants of Solusek Ro, to find a way to cast them out before they grow too strong. My excursions into the deeper caverns have led me to an answer, but I alone cannot retrieve what I require. If you [" .. eq.say_link("lend me your strength") .. "], I will in turn help you in your own destruction of our mutual foes.");
	elseif(e.message:findi("lend me your strength")) then
		e.self:Say("Excellent. Deeper within these caves lie many fierce denizens of flame. The kobolds fear them and rightly so for many dogs have fallen to the pure elemental might these creatures control. By harnessing this power, I believe I can produce a temper that once infused into a weapon will allow the owner to wield the very essence of fire itself. To create this temper, though, I need [" .. eq.say_link("raw materials") .. "].");
	elseif(e.message:findi("raw materials")) then
		e.self:Say("I need the very essence of the fire creatures that make their home here: pieces of flesh, drops of blood, fluids, bone or whatever else you can find that still radiates heat long after the creature is destroyed. I'll need parts from four different types of creatures to produce the temper. We've spoken long enough. You must go before you alert the kobolds to my presence. Return to me only once you have the materials.");
	elseif(qglobals["HelpGhaib"] == "1" and e.message:findi("weapon")) then
		e.self:Say("No common blade will suffice. The temper would melt it to slag. You'll need a weapon that can survive the process and I believe I know where to find one. During a recent excursion into the kobolds territory, I overheard them barking frantically about a [" .. eq.say_link("treasure") .. "] they found.");
	elseif(qglobals["HelpGhaib"] == "1" and e.message:findi("treasure")) then
		e.self:Say("It seems that while they were clearing out a small elemental conclave they found what could best be described as a pile of gaudy trash. Normally, Lord Nagafen's garbage is of little interest to me, but within the pile were the pieces of a sword that shattered upon the scales of Lord Nagafen himself. A weapon that has tasted the blood of the dragon! Such a [" .. eq.say_link("blade") .. "] will thrive under the exquisite heat of the temper!");
	elseif(qglobals["HelpGhaib"] == "1" and e.message:findi("blade")) then
		e.self:Say("True to their nature, the kobolds fought fiercely over the baubles and the pieces ended up in different paws. If you can recover them and bring them to me along with the temper I will forge the blade and infuse it with the powers of shadow and flame.");
		e.other:SummonItem(55260); --Flame-Forged Vial
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 55253, item2 = 55254, item3 = 55255, item4 = 55256})) then -- A Smoldering Tentacle, Seared Imp's Blood, Seared Ooze, Crystallized Soul of Fire
		e.self:Say("Yes, this will do nicely. Here is the temper, but you'll need a [" .. eq.say_link("weapon") .. "] to infuse");
		eq.set_global("HelpGhaib","1",0,"F");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 55257, item2 = 55258, item3 = 55259, item4 = 55260})) then -- Flame-Forged Vial, Melted Hilt, Shattered Blade (Top), Shattered Blade (Bottom)
		e.self:Say("Ah, you have returned. I was beginning to worry that the kobolds had grown more powerful than anticipated. I will now forge the blade. May it see the demise of many servants of Solusek Ro. Our pact is complete.");
		e.self:Emote("places the broken pieces of the sword upon the hard ground and pours the vial of radiant liquid over them. The liquid glows fiercely, infusing itself into the broken pieces of the sword and making the sword whole once more.");
		e.other:QuestReward(e.self,0,0,0,0,55261,100000); -- Ghaib's Flame-Forged Longsword
		eq.delete_global("HelpGhaib");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
