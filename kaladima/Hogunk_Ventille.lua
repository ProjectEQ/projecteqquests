function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. and welcome to Stormguard Hall. home to all great warriors! Are you also a [warrior of the Stormguard] or do you [follow another guild]?");
	elseif(e.message:findi("i am a warrior of the stormguard")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("As I thought. You do not appear to be one who relies on wits rather than brawn. no offense. I have word that a Stormguard on duty has deserted his post at one of the guardposts in the Butcherblocks. I want you to go and seek him out. He is Guard Bundin. Return his Stormguard axe to me. along with his head. There shall be no cowards in the Stormguard!!");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Prove yourself to the Stormguard and then we shall talk.  Perhaps you may assist Master Canloe and show your worth to us.");
		else
			e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.")
		end
	elseif(e.message:findi("i follow another guild")) then
		e.self:Say("Then go to your guild. This is the hall of the dwarven warriors - not a place for common folk to lounge around.");
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
	local text = "Aren't you forgetting something? I instructed you to return with Guard Bundin's Head and his Stormguard axe.";
	
	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12156, item2 = 5014},1,text)) then
		e.self:Say("I shall display this in the guard hall. Let it be a warning to all those who dare to run from battle. As for you, that was splendid work, but next time, remember to wrap decapitated heads in something drip-proof. Those stains will never come out! Oh yes, and here is your reward.");
		e.other:Faction(274,2); -- Faction: Kazon Stormhammer
		e.other:Faction(312,15); -- Faction: Storm Guard
		e.other:Faction(293,2); -- Faction: Miners Guild 249
		e.other:Faction(5025,3); -- Faction: Kaladim Merchants
		e.other:Faction(232,-3); -- Faction: Craknek Warriors
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(16),0,eq.ChooseRandom(5027,5034,6019,6024,7013,6018,5070,5071,6351),5000); -- Item(s): Bronze Long Sword (5027), Bronze Scimitar (5034), Bronze Mace (6019), Bronze Morning Star (6024), Bronze Rapier (7013), Fine Steel Morning Star (6351)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
