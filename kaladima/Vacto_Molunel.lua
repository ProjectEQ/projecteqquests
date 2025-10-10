function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met, " .. e.other:GetCleanName() .. "!  I am Vacto Molunel.  If you are seeking to outfit yourself with the finest weapons in all of Kaladim. I am the one to see.  I also posses a [rare talent] you might find useful.");
	elseif(e.message:findi("rare talent")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("Piqued your interest, did I?  Well, you see, I am one of the few dwarves who possess the knowledge and talent to craft a unique type of armor entirely out of scarab carapaces.  While my specialty is making [scarab helms]. I have also been convinced to make [scarab breastplates] and [scarab boots] from time to time.  All of the pieces I craft are to dwarven proportions, but I have had some gnomish and halfling customers as well.  They come from all over for my armor.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("scarab helms")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("Interested in a scarab helm, are you?  Well, because my talent is so unique and my time is so valuable, I am afraid I could only make you a helm if you were to provide me with the two scarab carapaces necessary to accommodate a head such as yours.  I will also need a payment of 5 gold pieces.  The Butcherblocks are crawling with worker scarabs that have just the right size carapaces for our needs.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("scarab breastplates")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("Ah..  A  scarab breastplate.. hmm.  Well, if you want to convince me to go though the trouble of crafting one of those, not only will you have to pay my fee of 23 gold pieces, you must provide me with a pristine giant scarab carapace.  I refuse to make a breastplate with cracked carapaces.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Prove yourself to the Stormguard and then we shall talk.  Perhaps you may assist Master Canloe and show your worth to us.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("scarab boots")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("Ah..  Scarab Boots.. hmm.  Well, if you want to convince me to go though the trouble of crafting a pair of those, not only will you have to pay my fee of 17 gold pieces, you must provide me with a cracked giant scarab shell and 2 scarab legs.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Prove yourself to the Stormguard and then we shall talk.  Perhaps you may assist Master Canloe and show your worth to us.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("irontoe")) then
		e.self:Say("The Irontoe Brigade was formed by Drumpy Irontoe. It was once the finest band of warriors in Kaladim. They were the elite branch of the Stormguard. King Kazon sent them on a mission to the lands of the Crushbone orcs. At the Battle of Busted Skull they met their fate.");
	elseif(e.message:findi("tumpy")) then
		e.self:Say("If you frequent the pubs, you just may run into Tumpy Irontoe. He was once the brave leader of the Irontoe Brigade. Whatever you do, do not mention the Battle of Busted Skull. I am sure that would bring back some bad memories for him.");
	elseif(e.message:findi("trondle")) then
		e.self:Say("Trondle Ogrebane is the legendary dwarven warrior who single-handedly exterminated the ogre clan called the [Mudtoes]. He was recently killed in battle. It took an entire legion of Crushbone orcs to bring him down. Furtog is still fuming about that.");
	elseif(e.message:findi("mudtoes")) then
		e.self:Say("The Mudtoes were a small clan of ogres. They lived somewhere in the Butcherblock Mountains. They had an insatiable appetite for dwarves. They were finally destroyed by the hand of Trondle Ogrebane.");
	elseif(e.message:findi("crushbone orc")) then
		e.self:Say("The army of the Crushbone orcs is deadly indeed. They are great military strategists. It was a legion of them that brought down the great [Trondle Ogrebane]. Speak with Furtog Ogrebane about the Crushbones. He has need of warriors such as you.");
	elseif(e.message:findi("battle of busted skull")) then
		e.self:Say("The Battle of Busted Skull was fought in the land of the Crushbone orcs.  King Kazon sent the entire Irontoe Brigade to retrieve an ancient artifact from an old dwarven outpost.  The battle was fierce.  At its end, only a handful of Irontoes made it back.  After that, the Irontoe Brigade survivors left Kaladim for good.  All except Tumpy Irontoe.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Well, that is one of the items I need to make scarab boots. Do you have the rest?";
	local text2 = "This is good, but in order to finish the job, I need both a pristine giant scarab carapace and 23 gold.";
	local text3 = "Remember, for the scarab helm I require you give me two scarab carapaces as well as 5 gold.";
	
	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13849, item2 = 13849, gold = 4},1,text3)) then -- helm
		e.self:Say("Excellent. Here is your helm. Wear it with pride! And be sure to occasionally wipe out the insulating mucus that tends to build up on its underside. It will make your hair fall out. One more thing, would you be interested in [scarab boots] to match your helm?");
		e.other:Faction(312,2,0); -- Storm Guard
		e.other:Faction(274,1,0); -- Kazon Stormhammer
		e.other:Faction(293,1,0); -- Miners Guild 249
		e.other:Faction(290,1,0); -- Merchants of Kaladim
		e.other:Faction(232,-1,0);	-- Craknek Warrior
		e.other:QuestReward(e.self,0,0,0,0,2175,500); -- verified live xp
	end
	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13133, gold = 22},1,text2)) then -- breastplate
		e.self:Say("If I do say so myself, this is one of the finest breastplates in all of Norrath. I am truly a master at my craft. You might want to wipe out some of the excess scarab goo before wearing it, though.");
		e.other:Faction(312,5,0); -- Storm Guard
		e.other:Faction(274,1,0); -- Kazon Stormhammer
		e.other:Faction(293,1,0); -- Miners Guild 249
		e.other:Faction(290,1,0); -- Merchants of Kaladim
		e.other:Faction(232,-1,0);	-- Craknek Warrior
		e.other:QuestReward(e.self,0,0,0,0,2176,5000);
	end
	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13132, item2 = 13848, item3 = 13848, gold = 16},1,text1)) then -- boots
		e.self:Say("Very good! Let me see here. Thread the legs around like this and... There you go. Wear them with pride!");
		e.other:Faction(312,3,0); -- Storm Guard
		e.other:Faction(274,1,0); -- Kazon Stormhammer
		e.other:Faction(293,1,0); -- Miners Guild 249
		e.other:Faction(290,1,0); -- Merchants of Kaladim
		e.other:Faction(232,-1,0);	-- Craknek Warrior
		e.other:QuestReward(e.self,0,0,0,0,2177,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
