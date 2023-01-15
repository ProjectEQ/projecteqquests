--Vorkiev Plate Armor (Tier 1)

function event_say(e)
	if (e.other:GetFaction(e.self) <= 2) then -- require warmly
		if(e.message:findi("hail")) then
		  e.self:Say("Hello, ".. e.other:GetCleanName() ..". I am Vorkiev, a former smith of Dranik. Word of your battles against the Muramites has passed from ear to ear across Kuua. You bring hope to the dragorn who long to be free from the shadow of Mata Muram! Perhaps we can be of [service] to one another?");
		elseif(e.message:findi("service")) then
		  e.self:Say("A decade ago my forge created great suits of armor to protect Kuua's strongest warriors. When the Muramites came, however, they sought to conscript me to make armor for their captains. Rather than comply, I fled into the wilderness to live as an exile. I have no regrets about my decision, but I do long for the old days, back when the land was green and the dragorn stood side by side against their enemies, instead of kowtowing to these forsaken Muramites. There many tasks I need accomplished that I am unable to see through myself due to my exile. If you can help me, I can reward you with finely crafted plate armor for your [hands], [wrists], [arms], [head], [chest], [legs], or [feet]. What say you?");
		elseif(e.message:findi("head")) then
		  e.self:Say("When Discord first impinged upon our world, sentiments of treachery and paranoia crept into our lives. Dragorn turned on dragorn and longstanding friendships ended in bitter squabbling. One dragorn, Noble Yemall the Arcane, kept his wits enough to realize what was happening. Yemall toiled tirelessly to counter the effects of Discord. Although his efforts were ultimately in vain, it is said that he was able to author a treatise before the Muramites seized him. This treatise, entitled The Duskfall Chronicles, contains his reflections on the nature of Discord and was likely seized by the Muramites. Retrieve this treatise along with two bristling ukun hides to use as book covers so I can bind the book and protect it from the elements. Hopefully the knowledge in this book will help me to survive in Kuua on my own, now that Discord is seeping further and further across our world. Do this for me and my best plate helm shall be your reward.");
		elseif(e.message:findi("arm")) then
		  e.self:Say("The armies of Mata Muram are but one aspect of Discord's deep shadow. The Darkening ravaged not only the denizens of Kuua, but the landscape as well. Many of our old landmarks no longer stand and the sky -- once blue and vast -- now seethes with ash and storms. If you can find a map of Old Kuua, one drawn before the coming of Discord, I will be in your debt. Return with this map along with two ukun quills so I can take notes on the map. My exile is long and there is no end in sight. I would like to reorient myself out here in the wilderness. Do this for me and I can reward you with some of my finely crafted arm guards.");
		elseif(e.message:findi("wrist")) then
		  e.self:Say("Did you know that dragorns were created by the death of a single dragon named Dranik, the great father? The first dragorn to walk Kuua created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. The last dragorn armies to carry the banner fell to the Muramites. No one can say where the Blood Standard of Dranik has gone, but the recovery of such an artifact would leave me in your debt. Return with this banner along with two Ashlock branches, so I can remake the haft. From there, I can reward you with a powerfully crafted wristguard.");
		elseif(e.message:findi("hand")) then
		  e.self:Say("I appreciate your enthusiasm. Be careful though, this will not be easy for I require a rare item that is entrusted only to the Muramite captains. Harbinger's Spire was once a dragorn lookout tower which Mata Muram has since claimed and bent to his own purposes. He uses the spire as a beacon to receive news on his domain. Some of his captains possess infused crystal shards which can be used to send messages from Harbinger's Spire. If you can capture one of these infused spire control shards along with the satchels of two discordling messengers, it may disrupt the Muramite chain of command long enough to afford me a chance to return home for a day. I have not seen many of my kin since The Darkening fell upon Kuua and I long to know if any of them are still alive. Recover these items for me and you shall be rewarded with my finest plate gauntlets.");
		elseif(e.message:findi("chest")) then
		  e.self:Say("The chest piece is the most-prized piece of my collection. For this I will require a special favor from you. Before the Muramites came, the High Council of Eight ruled over Dranik. The eight nobles, lead by Jelvan the Eldest, each carried scepters that were said to be carved from the bones of the first dragorn sons. It is said that these scepters will glow as long as their owner is alive. I have not seen or heard from the council since the Muramites overran our city, but I have heard that these scepters were handed out by Mata Muram as trophies. If you can recover one of these scepters along with three shorn murkglider tentacles to disguise it from the searching Muramites, I can keep it with me. Its soft glow will remind me that there is still hope for Dranik.");
		elseif(e.message:findi("leg")) then
		  e.self:Say("Kuua was not the first world touched by Discord. There have been many others. I know this because I have heard the Muramites tell stories of past conquests. One of the stories they tell is that the last ember of a Discord-ravaged city will burn for many years, long after the ruins of the city itself have been covered over by time. Some say it's the city's spirit slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three Dranik incense burners to hold it in, I will reward you with my finest set of plate greaves.");
		elseif(e.message:findi("feet")) then
		  e.self:Say("When Discord first descended upon Kuua, many of my own kin turned traitor. Most dragorn who marched against Dranik were already in exile and seeking vengeance for their punishment, but a handful were established dragorn who conspired against us from within. These established dragorn did the most damage to our defense efforts as they worked against us without our knowledge. There is talk of a traitors' stone which is etched with the names of all dragorn who conspired with the Muramites in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitors' stones, along with two kyv bowstrings so that I can hang this rock of traitors for all to see. Although the dragorn have been occupied for the better part of a decade now, this may still cause stir up trouble for the Muramites. Do this for me and I can grant you my plate boots as a reward.");
    		end
	else
		e.self:Emote("hisses at you.");

	end
end


function event_trade(e)
	local class = e.other:Class();
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 2 or e.other:GetGM() and (class == "Warrior" or class == "Paladin" or class == "Shadow Knight" or class == "Bard" or class == "Cleric" or e.other:GetGM())) then -- require warmly and plate
		
		if(item_lib.check_turn_in(e.trade, {item1 = 51446,item2 = 51453,item3 = 51453})) then -- plate hand rewards Spire Control Shard, 2x Discordling Message Satchel
			e.self:Say("Well met, ".. e.other:GetCleanName() ..". You may have well disrupted the Muramite chain of command long enough to afford me a chance to go looking for my surviving brothers. The Muramites are on the watch for me, but now they will be scrambling for word from their master. To thank you for your efforts, here are the plate gloves I have promised you.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70744,100000); -- Item: Armsmaster's Gloves
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70758,100000); -- Item: Oathbound Gauntlets
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70772,100000); -- Item: Heartstiller's Mail Gloves
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70793,100000); -- Item: Traveler's Mail Gloves
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70751,100000); -- Item: Sanctified Gloves
				end


		elseif(item_lib.check_turn_in(e.trade, {item1 = 51445,item2 = 51452,item3 = 51452})) then -- plate wrist rewards Dranik Blood Standard , 2x Ashlock Branch
			e.self:Say("The Blood Standard of Dranik! So it was not destroyed! Well done, ".. e.other:GetCleanName() ..". I make sure this banner remains in the hands of those still loyal to the old ways. May it fly over the free armies of Kuua once again. Here is the wristguard I have promised. May they serve you well in your future battles against the Muramites!");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70743,100000); -- Item: 70743);#Armsmaster's Bracer
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70757,100000); -- Item: (70757);#Oathbound Bracer
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70771,100000); -- Item: (70771);#Heartstiller's Mail Wristguard
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70792,100000); -- Item: (70792);#Traveler's Mail Wristband
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70750,100000); -- Item: (70750);#Sanctified Wristguard
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51444,item2 = 51451,item3 = 51451})) then -- plate arms rewards Map of Old Kuua, 2x Ukun Quill
			e.self:Say("A map of Old Kuua! How this map makes me long for the old days, back when we were a free race! My thanks, ".. e.other:GetCleanName() ..". This map may help relearn the new landscape in the context of the old. Here is a set of ornate arm guards as your reward.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70742,100000); -- Item: (70742);#Armsmaster's Sleeves
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70756,100000); -- Item: (70756);#Oathbound Armguards
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70770,100000); -- Item: (70770);#Heartstiller's Mail Sleeves
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70791,100000); -- Item: (70791);#Traveler's Mail Sleeves
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70749,100000); -- Item: (70749);#Sanctified Sleeves
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51440,item2 = 51447,item3 = 51447})) then -- plate head rewards Duskfall Chronicles, 2x Bristling Ukun Hide
			e.self:Say("Well met, ".. e.other:GetCleanName() ..". Hopefully this book will contain some valuable information on the nature of Discord. To survive on my own, I must first understand the poison affecting the land. As promised, here is the helm as your reward for such a dangerous mission.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70741,100000); -- Item: (70741);#Armsmaster's Helm
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70755,100000); -- Item: (70755);#Oathbound Helm
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70769,100000); -- Item: (70769);#Heartstiller's Mail Helm
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70790,100000); -- Item: (70790);#Traveler's Mail Cap
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70748,100000); -- Item: (70748);#Sanctified Headdress
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51441,item2 = 51448,item3 = 51448,item4 = 51448})) then -- plate chest rewards Dragorn Elder Scepter, 3x Shorn Murkglider Tentacle
			e.self:Say("This is the scepter of Noble Pravel the Diviner! I recognize the markings! I can tell by the way the light has faded that he no longer draws breath. Though this is terrible news, I'm grateful at least you have recovered it from the Muramites. I'll try to smuggle this back to those still loyal to Dranik. Thanks you,".. e.other:GetCleanName() ..". As promised, here is my chain vest. It has grown too cumbersome for me to carry in my wanderings.'");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70746,100000); -- Item: (70746);#Armsmaster's Breastplate
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70760,100000); -- Item: (70760);#Oathbound Breastplate
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70774,100000); -- Item:(70774);#Heartstiller's Mail Chestguard
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70795,100000); -- Item: (70795);#Traveler's Mail Chestguard
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70753,100000); -- Item: (70753);#Sanctified Chestguard
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51442,item2 = 51449,item3 = 51449,item4 = 51449})) then -- plate leg rewards Dragorn City Ember, 3x Dranik Incense Burner
			e.self:Say("Hmm, I shudder to think what names I will find scribed on this rock, but I thank you for your work none the less. Hopefully, this list can be used to stir some more dissention among the dragorn that have sworn loyalty to Mata Muram for the time being. Here are the plate boots I have promised. May they serve you well, ".. e.other:GetCleanName() ..".");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70747,100000); -- Item: (70747);#Armsmaster's Leggings
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70761,100000); -- Item: (70761);#Oathbound Legguards
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70775,100000); -- Item: (70775);#Heartstiller's Mail Leggings
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70796,100000); -- Item:(70796);#Traveler's Mail Legguards
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70754,100000); -- Item:(70754);#Sanctified Leggings
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51443,item2 = 51450,item3 = 51450})) then -- plate feet rewards Kuuan Traitor Stone, 2x Kyv Bowstring
			e.self:Say("So, the embers do exist! Excellent work, ".. e.other:GetCleanName() ..". I plan to hold this ember in the forge when crafting in the future. This will ensure that the ember's heat is used to forge armor for the enemies of the Muramites. Poetic justice, don't you think? For your efforts, here are the greaves as promised!");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70745,100000); -- Item: (70745);#Armsmaster's Boots
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70759,100000); -- Item: (70759);#Oathbound Boots
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70773,100000); -- Item:(70773);#Heartstiller's Mail Boots
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70794,100000); -- Item:(70794);#Traveler's Mail Boot
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70752,100000); -- Item: (70752);#Sanctified Footwear
				end
		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
