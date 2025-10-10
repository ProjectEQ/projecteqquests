function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Step forth, young " .. e.other:GetCleanName() .. "! I heard that you have come of age! The spirit of adventure has entered your body. That is good. Go and speak with the others. They shall help you. I am afraid I have no time to spend conversing. There is much I have to [ponder].");
	elseif(e.message:findi("ponder")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("Must you know everyone's business? Hmm.. Maybe you can be of assistance. You see, I have been instructed by Furtog to tend to a matter of extreme urgency, which is keeping me from clearing the mines of rats. Will you assist and [exterminate the rats]?");
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("Prove yourself to the Stormguard and then we shall talk.  Perhaps you may assist Master Canloe and show your worth to us.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("exterminate")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("Very good! I shall reward you for every four giant rat pelts returned to me. And be on the lookout for a [metal rat]!");
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("Prove yourself to the Stormguard and then we shall talk.  Perhaps you may assist Master Canloe and show your worth to us.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("metal")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("I cannot tell you how many reports I have heard of metal rats in Kaladim. I first thought it was a vision obtained from having too many Tumpy Tonics, but Furtog himself is said to have seen them. If you ever catch sight of the little metal beast, give chase!! Return its metal carcass to me and I shall reward you.");
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("Prove yourself to the Stormguard and then we shall talk.  Perhaps you may assist Master Canloe and show your worth to us.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("matter")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("I am apprehensive about sending one who is so young out into the world, but I have a good feeling about you, " .. e.other:GetCleanName() .. ". Someone has stolen the [Eye of Stormhammer]. You must journey to Antonica and go to a place called Highpass Hold. The rogue who has it is locked up in the prison. We have arranged for his extradition to Kaladim. Please give the jail clerk this note of release.");
			e.other:SummonItem(18935); -- Sealed Note
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("Prove yourself to the Stormguard and then we shall talk.  Perhaps you may assist Master Canloe and show your worth to us.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("eye")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("The great statue of Kazon Stormhammer was once encrusted with two great gems from the mines of Butcherblock. So big were they that it took the magic of the high elves to assist us in lifting them to the statue's face. In the year 2995, somehow, someone stole one of the eyes. We decided to keep the remaining eye in the vault. Now, even that has been stolen from us! Only the most trusted warriors may be involved in this [important Stormguard matter].");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("doran")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("Doran resides on an island in the Ocean of Tears. The island is filled with beautiful maidens. I could think of worse places to live.");
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
	local temphandins = 0;
	local text = "Good work, but I require four giant rat pelts.";

	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13054, item2 = 13054, item3 = 13054, item4 = 13054},1,text)) then -- Giant Rat Pelt
		e.self:Say("Great work, young one! We shall soon rid our mines of these pests. Keep a lookout for that [metal rat]. Here is a small reward for such fine work. Soon, you shall be know as Kaladim's resident exterminator.");
		e.other:Faction(312, 10); -- Storm Guard
		e.other:Faction(274, 1); -- Kazon Stormhammer
		e.other:Faction(293, 1); -- Miner's Guild 249
		e.other:Faction(290, 2); -- Merchants of Kaladim
		e.other:Faction(232, -2); -- Craknek Warriors
		e.other:QuestReward(e.self,0,0,math.random(5),0,eq.ChooseRandom(13036,1051,13003,13002,10015,13009),4200); -- verified live xp
	elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13282})) then -- Scrap Metal
		e.self:Say("I thank you, my friend. I was to destroy this metal monster months ago. I could never find him. Please accept this reward for such good service. Oh yes.. And take this card to a man named [Doran Vargnus]. He is a fine blacksmith. I am sure he will reward you with one of his finest suits of armor. Perhaps you may now assist in an [important Stormguard matter].");
		e.other:Faction(312, 20); -- Storm Guard
		e.other:Faction(274, 3); -- Kazon Stormhammer
		e.other:Faction(293, 3); -- Miner's Guild 249
		e.other:Faction(290, 5); -- Merchants of Kaladim
		e.other:Faction(232, -5); -- Craknek Warriors
		e.other:QuestReward(e.self,math.random(10),0,0,0,13995,5000); -- Knight (Card) -- verified live xp
	elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13321})) then -- Eye of Stormhammer
		--Quest text, exp, cash, factions made up
		e.self:Say("You've found it! I'm glad you managed to hunt down and return the stolen eye for us, " .. e.other:GetCleanName() .. ". Such effort requires a similar reward so take this and use it well.");
		e.other:Faction(312, 20); -- Storm Guard
		e.other:Faction(274, 3); -- Kazon Stormhammer
		e.other:Faction(293, 3); -- Miner's Guild 249
		e.other:Faction(290, 5); -- Merchants of Kaladim
		e.other:Faction(232, -5); -- Craknek Warriors
		e.other:QuestReward(e.self,math.random(5),0,0,0,5415,5000); -- Avenger Battle Axe
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
