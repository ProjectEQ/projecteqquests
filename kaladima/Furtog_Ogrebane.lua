function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:HasItem(0) then
		e.other:Message(MT.Yellow,"Furtog Ogrebane glances your way. 'Ah a new recruit! Oh, how I enjoy meeting new recruits! With my training one day you could be a powerful member of the Stormguard! Read the note in your inventory and then hand it to me when you wish to begin your training!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, mighty " .. e.other:GetCleanName() .. "! Welcome to Stormguard Hall. I am Captain Furtog Ogrebane, only surviving descendant of the legendary Trondle Ogrebane, slayer of the [Mudtoes]. If you wish to serve the grand city of Kaladim. I urge you to speak with any of the trainers. Good day.");
	elseif(e.message:findi("mudtoes") and not e.message:findi("searching")) then
		e.self:Say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
	elseif(e.message:findi("trondle")) then
		e.self:Say("Trondle was my great father and slayer of the Mudtoes. He was killed by those vile Crushbone orcs. If you truly wish to help Kaladim remain safe. speak with trainer Canloe Nusback. Say that you are ready to serve Kaladim.");
	elseif(e.message:findi("searching")) then
		e.self:Say("I have heard persistent rumors of two Mudtoe ogres who survived the slaughter.  Go to the port of Butcherblock.  Those dock hands must have heard of the name [Mudtoe].  Bring me the remaining heads of the Mudtoes!!  I want all the Mudtoes dead!!  Do not return until you have them both!!");
	elseif(e.message:findi("irontoe")) then
		e.self:Say("The Irontoe Brigade was formed by Drumpy Irontoe. It was once the finest band of warriors in Kaladim. They were the elite branch of the Stormguard. King Kazon sent them on a mission to the lands of the Crushbone orcs. At the Battle of Busted Skull they met their fate.");
	elseif(e.message:findi("tumpy")) then
		e.self:Say("If you frequent the pubs, you just may run into Tumpy Irontoe. He was once the brave leader of the Irontoe Brigade. Whatever you do, do not mention the Battle of Busted Skull. I am sure that would bring back some bad memories for him.");
	elseif(e.message:findi("crushbone orc")) then
		e.self:Say("The army of the Crushbone orcs is deadly indeed. They are great military strategists. It was a legion of them that brought down the great [Trondle Ogrebane]. Speak with Furtog Ogrebane about the Crushbones. He has need of warriors such as you.");
	elseif(e.message:findi("battle of busted skull")) then
		e.self:Say("The Battle of Busted Skull was fought in the land of the Crushbone orcs.  King Kazon sent the entire Irontoe Brigade to retrieve an ancient artifact from an old dwarven outpost.  The battle was fierce.  At its end, only a handful of Irontoes made it back.  After that, the Irontoe Brigade survivors left Kaladim for good.  All except Tumpy Irontoe.");
	elseif(eq.is_omens_of_war_enabled()) then
    	if(e.message:findi("trades")) then
        	e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
	       	e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
    	elseif(e.message:findi("second book")) then
        	e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
        	e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
    	end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "There is another! I have reports that there were two Mudtoe ogres on the island chain in the Ocean of Tears. I want both heads!";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18766})) then -- Recruitment Letter
		e.self:Say("Greetings, friend, and welcome to Stormguard Hall! I am Furtog Ogrebane, Captain of the Guard. We shall train you to be a fearless warrior, who will serve and protect King Kazon well. Here is your tunic.  Now, let's begin your training.");
		e.other:Faction(312,100); -- Storm Guard
		e.other:Faction(274,15); -- Kazon Stormhammer
		e.other:Faction(293,15); -- Miners Guild 249
		e.other:Faction(290,25); -- Merchants of Kaladim
		e.other:Faction(232,-25); -- Craknek Warriors
		e.other:QuestReward(e.self,0,0,0,0,13515,20); -- Dirt Stained Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13316, item2 = 13317},1,text)) then -- Ogre Heads
		e.self:Say("Finally my great father's work has been completed. All the Mudtoe ogres have been exterminated. Thank you. Take this weapon which my father pried from the cold, dead hands of the Mudtoe ogre captain. It is called an ogre war maul. May you wield it with honor in the name of Kaladim.");
		-- confirmed live factions
		e.other:Faction(312, 50); -- Storm Guard
		e.other:Faction(274, 7); -- Kazon Stormhammer
		e.other:Faction(293, 7); -- Miners Guild 249
		e.other:Faction(290, 12); -- Merchants of Kaladim
		e.other:Faction(232, -12); -- Craknek Warriors
		e.other:QuestReward(e.self,0,math.random(10), math.random(10), math.random(3),6302,250); -- Ogre War Maul
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
