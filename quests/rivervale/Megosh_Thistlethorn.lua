function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18432)) then
		e.other:Message(15,"The fragrent smell of jumjum growing in the nearby field greets your nostrils. As you take in the wonderful fragrance, an important looking Halfling greets you. 'Welcome to the Tagglefoot's Farmstead. I am Megosh Thistlethorn. I can see by the gleam in your eyes that you are here to begin your training with the Storm Reapers. Read the note in your inventory and then hand it to me when you are ready to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. "! I am Megosh Thistlethorn first Ranger of the Storm Reapers of Rivervale. I journeyed many years ago to the Surefall Glade far to the west of our lovely shire. It was there I trained with the human and half-elven rangers that like the Storm Reapers are faithful disciples of Karana. I have returned now to Rivervale to teach our interested young people the ways of a ranger of the Storm Lord. so that we may defend our shire and the wilds of Norrath from the [evil forces] that would see it destroyed.");
	elseif(e.message:findi("evil forces")) then  
		e.self:Say("Currently the Death Fist Clan of Orcs. a race of bloodthirsty humanoids concerned only with expanding their territory and slaughtering all who stand in their path. threatens our homeland. The Orcs have long had a minor presence in the Misty Thicket but lately they have been amassing in greater numbers. The Death Fist has been chopping down our trees and quarrying rock from the nearby mountains. We know only that they have been shipping the materials to the commonlands and stockpiling it for what purpose we do not know. As rangers of the Storm Reapers it is our duty to [stop the desecration] of the thicket.");
	elseif(e.message:findi("stop the desecration")) then
		e.self:Say("First you must outfit yourself for battle with the Death Fists. Seek Bipdo Hargin here in Rivervale and give him this letter. He will instruct you further on getting yourself outfitted for the tasks ahead. Once you have been outfitted in a suit of Thorn Mail Armor return to me and I will instruct you for your [next task].");
		e.other:SummonItem(19627);
	elseif(e.message:findi("next task")) then
		e.self:Say("If you feel you are ready to face the Orcs of Clan Death Fist then journey to the Misty Thicket beyond the protection of the Wall of Cetelt. Hunt the Orcs that are cutting down the trees of the thicket and bring me two of the Orc Lumberjack Axes and two of the Orc Lumberjack Machetes.");
	elseif(e.message:findi("forge")) then
		e.self:Say("What forge?  Didn't you see it on the way in, young " .. e.other:GetName() .. "?  Oh, and check with Smithy Bodbin about the sharpening stones, he usually has a good supply of them.");
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18432})) then -- Handin the Halfling Ranger note
		e.self:Say("Welcome to the Storm Reapers " .. e.other:GetName() .. "! Here is a tunic to keep you warm in your travels. Rivervale, our lovely home is facing dangerous times. From both the east and west forces devoted to the evil Gods Bertoxxulous adn Innoruuk are corrupting and destroying the wilds of Norrath. Also, the Orcs of Clan Deathfist are waging war on this entire region and gathering lumber and stone for some unknown purpose. We must do our best to preserve the lands and way of life of all Karanas people. Once you are ready to begin defending the vale against the [evil forces], please return to me. I also posses knowledge of various [trades], seek me out when you wish to learn about them.");
		e.other:SummonItem(13541); -- Jumjum Sack Tunic*
		e.other:Ding();
		e.other:Faction(316,10,0);
		e.other:Faction(208,10,0);
		e.other:Faction(218,10,0);
		e.other:Faction(347,-15,0);
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 19622,item2 = 19622,item3 = 19623,item4 = 19623})) then -- Handin 2 Orc LumberJack Axes and 2 Orc LumberJack Machetes
		e.self:Say("Excellent work young Storm Reaper " .. e.other:GetName() .. ". Now take this Dull Storm Reaper Machete to a [forge] and sharpen it with a sharpening stone. It may take several attempts to get the blade to an adequate sharpness if you are unfamiliar with the process. Once it is sharpened give it to Bodbin Gimple with a ruined thorn drakeling scales and he will put the finishing touches on what will be a fine weapon!");
		e.other:SummonItem(19624);
		e.other:Ding();
		e.other:Faction(316,5,0);
		e.other:Faction(208,5,0);
		e.other:Faction(218,5,0);
		e.other:Faction(347,-5,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19050 -- Megosh_Thistlethorn