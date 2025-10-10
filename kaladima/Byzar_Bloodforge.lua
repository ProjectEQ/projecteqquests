--NPC: Byzar_Bloodforge  --Zone: kaladima
--modified by Qadar

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("State your business!!  I have no time for chitchat.  Well..  speak up. toad!!  What?!!..  Have you come here to [return goblin beads]?");
	elseif(e.message:findi("return goblin beads")) then
		e.self:Say("If you wish to return Runnyeye Warbeads you best have at least four of them.  Do not waste my time with any less.  If I am in a good mood I just may reward you with some trash, err..  I mean equipment from our armory.");
	elseif(e.message:findi("Zarchoomi") or e.message:findi("Corflunk")) then
			e.self:Say("Do not speak the names of Zarchoomi and Corflunk!!  I have heard enough of those ogres!!  I would pay greatly for their heads!!");
	elseif(e.message:findi("take a little trip")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("Yes.  You will do.  My sister was once engaged to a fellow warrior.  He disgraced her and left her crying at the altar.  I will have his head for such a slap in the face of my family.  His name was Trumpy Irontoe, once a member of the now defunct Irontoe Brigade.  I know not where he went.  Find his whereabouts and return his head to me.  Do so, and I shall make you an honorary member of the Bloodforge Brigade.");
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
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
	local text = "What good is one?! I called for the heads of both Corflunk and Zarchoomi!";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13931, item2 = 13931, item3 = 13931, item4 = 13931})) then
		e.self:Say("You finally have proven yourself a warrior, a slow one!!  Take this reward and ask for nothing else.  You should be proud to defend Kaladim and expect no reward.");
		e.other:Faction(312,5);   -- StormGuard better
		e.other:Faction(274,1);   -- KazonStormhammer better
		e.other:Faction(293,1);   -- MinersGuild249 better
		e.other:Faction(290,1);   -- MerchantsOfKaladim better
		e.other:Faction(232,-1);   -- CraknekWarriors worse
		e.other:QuestReward(e.self,math.random(10),math.random(5),math.random(5),0,eq.ChooseRandom(2113,2114,2115,2116,2117,2118,2119,2120,2121,2122),1000); -- Item(s): Small Tattered Skullcap (2113), Small Tattered Mask (2114), Small Tattered Gorget (2115), Small Tattered Shoulderpads (2117), Small Tattered Belt (2119), Small Tattered Wristbands (2121), Small Tattered Gloves (2122)
	elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13741, item2 = 13740},1,text)) then
		e.self:Say("I underestimated you.  You are truly a great warrior.  I reward you with a piece of my own Bloodforge armor.  You would be fine Bloodforge Brigade material!  How would you like to [take a little trip] in the name of the Bloodforge Brigade?");
		e.other:Faction(312,20);   -- StormGuard better
		e.other:Faction(274,3);   -- KazonStormhammer better
		e.other:Faction(293,3);   -- MinersGuild249 better
		e.other:Faction(290,5);   -- MerchantsOfKaladim better
		e.other:Faction(232,-5);   -- CraknekWarriors worse
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(3090,3091,3092,3093,3094,3095,3096),1000); -- Item(s): Bloodforge Helm (3090), Bloodforge Helm (3090), Bloodforge Helm (3090), Bloodforge Helm (3090), Bloodforge Helm (3090), Bloodforge Helm (3090), Bloodforge Mail (3091), Bloodforge Armplates (3092), Bloodforge Bracers (3093), Bloodforge Gauntlets (3094), Bloodforge Legplates (3095), Bloodforge Boots (3096)
	elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12136})) then
		e.self:Say("Ha!! His death brings me great happiness.  I owe you much.  Take this hammer.  It is the hammer of the Bloodforge Brigade.  May it serve you well.  Now go, so I can enjoy this moment of happiness alone.");
		e.other:Faction(312,5);   -- StormGuard better
		e.other:Faction(274,1);   -- KazonStormhammer better
		e.other:Faction(293,1);   -- MinersGuild249 better
		e.other:Faction(290,1);   -- MerchantsOfKaladim better
		e.other:Faction(232,-1);   -- CraknekWarriors worse
		e.other:QuestReward(e.self,0,0,0,0,13314,10000); -- Item: Bloodforge Hammer
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
