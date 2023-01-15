--Shorvock's Chain Armor (Tier 1)  
-- all turn-ins needed to be parsed on live for proper emotes

function event_say(e)
	if (e.other:GetFaction(e.self) <= 2) then -- require warmly
		if(e.message:findi("hail")) then
		  e.self:Say("Shhh. Keep your voice down. What I am about to say, I share with you in strictest confidence. I have heard it whispered that you are an enemy of the Muramites? If this is so, I have much need of your [help].");
		elseif(e.message:findi("help")) then
		  e.self:Say("My name is not Shorvock, but rather Durhosk. I was one of the captains of the force lead by Rurof the Negotiator against the Muramites. Although Rurof and the rest of our company perished in the explosion of Dranik, I myself survived by a stroke of luck for I was away patrolling our rank's southern flank. Still, the shockwave knocked me unconscious for many hours. By the time I awoke, everyone was dead or gone. Left with no choice, I fled into the countryside, assuming the alias 'Shorvock.' Ever since then, I've been searching for other [survivors] of Rurof's army.");
    elseif(e.message:findi("survivor")) then
		  e.self:Say("I have heard rumors that a few of my companions survived as well and have since set up raiding parties to waylay the Muramites. If only I could find them again! I would be more vocal in my search, but I fear the Muramites will recognize me and end my life. If you can help me in my quest, I can reward you with chain armor for your [hands], [wrists], [arms], [head], [chest], [legs], or [feet]. It is part of my old battle mail, which I can no longer wear because its splendor will draw too much attention.");
		elseif(e.message:findi("head")) then
		  e.self:Say("When Discord first impinged upon our world, sentiments of treachery and paranoia crept into our lives. Dragorn turned on dragorn and longstanding friendships ended in bitter squabbling. One dragorn, Noble Yemall the Arcane, kept his wits enough to realize what was happening. Before the Muramites came, Yemall toiled tirelessly to counter the effects of Discord. Although his efforts were ultimately in vain, it is said that he was able to author a treatise before the Muramites seized him. This treatise, entitled The Duskfall Chronicles, contains his reflections on the nature of Discord. No one knows what has happened to this text, but if you are able to recover it, I may be able to understand Discord and avoid mistakes of the past. Bring me this treatise along with two deepshadow feran pelts so that I may make a book cover. Do this for me and I will reward you with my chain coif.");
		elseif(e.message:findi("arm")) then
		  e.self:Say("The armies of Mata Muram are but one aspect of Discord's deep shadow. The Darkening ravaged not only the denizens of Kuua, but also the landscape as well. Many of our old landmarks no longer stand and the sky -- once blue and vast -- now seethes with ash and storms. If you can find a map of Old Kuua, one drawn before the coming of Discord, I may be able to use it to find my way again. I have many miles to cover if I am to find my lost men and the terrain looks so alien to me. Return with such a map along with two Kuuan Lodestones so I can make a compass. Your efforts will be rewarded with my chain armwraps. Best of luck.");
		elseif(e.message:findi("wrist")) then
		  e.self:Say("My kin believe that all the dragorn were created by the death of a single dragon, Dranik, the great father. The first dragorn to walk Kuua created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. The last dragorn armies to carry the banner fell to the Muramites. No one can say where the Blood Standard of Dranik has gone, but the recovery of such an artifact would leave me in your debt. Return with this banner along with two shed ikaav skins to hide it in. One of my men, a sergeant named Tibor, used to carry this standard into battle. Although he is probably dead, it would honor his memory if you recovered this standard born by my lost friend. I'd be happy to reward your efforts with my chain bracer.");
		elseif(e.message:findi("hand")) then
		  e.self:Say("Harbinger's Spire was once a dragorn lookout tower which Mata Muram has since claimed and bent to his own purposes. He uses the spire as a beacon to receive news on his domain. Some of his captains possess infused crystal shards which can be used to send up beacons from Harbinger's Spire. Return to me with one of these infused spire control shards along with two darkshorn Kyv hoods. The hoods will help me hide my identity and the crystal shard will produce a break in the Muramite chain of command, allowing me greater freedom . . . at least for a few days. Do this for me and I can reward you with my finely crafted pair of chain gloves.");
		elseif(e.message:findi("chest")) then
		  e.self:Say("Before the Muramites came, the Council of Eight ruled over Dranik. The eight nobles, lead by Jelvan the Eldest each carried scepters that were said to be carved from the bones of the first dragorn sons. It is said that these scepters will glow as long as their owner is alive. I have not seen or heard from the council since the Muramites overran our city, but I have heard that these scepters were handed out by Mata Muram. If you can recover one of these scepters along with three ragged discordling skins to hide it in, I can smuggle this relic of the dragorn away from the Muramites. They should not be in control of such a relic. Relieve our enemies of this relic and I can reward you with my chain vest.");
		elseif(e.message:findi("leg")) then
		  e.self:Say("Kuua was not the first world touched by Discord. There have been many others. I know this because I have heard the Muramites tell stories of past conquests. One of the stories they tell is that the last ember of a Discord-ravaged city will burn for many years, long after the ruins of the city itself have been covered over by time. Some say it's the city's spirit slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three locks of a chimera's mane, I can make a charm to bribe my way past any Muramite who may find me. My enemies are everywhere and I need insurance in case they see through my guise. Do this for me and you shall be rewarded with my old chain leggings.");
		elseif(e.message:findi("feet")) then
		  e.self:Say("When Discord first descended upon Kuua, many of my own kin turned traitor. These traitors did considerable damage to our defense efforts for they worked against us without our knowledge. There is talk of a traitors' stone which is etched with the names of all dragorn who conspired with the Muramites in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitors' stones, along with two Muramite dispatches, I can use them to learn who to trust and who to avoid on my quest to find my missing legion. There are many who would turn me in if they knew my true identity, but this stone should help me sort friend from foe. Bring this stone to me and I can reward you with my chain boots.");
    		end
	else
		e.self:Emote("hisses as you approach but does not attack.");

	end
end


function event_trade(e)
	local class = e.other:Class();
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 2 or e.other:GetGM() and (class == "Berserker" or class == "Rogue" or class == "Shaman" or class == "Ranger" or e.other:GetGM())) then -- require warmly and plate
		
		if(item_lib.check_turn_in(e.trade, {item1 = 51446,item2 = 51460,item3 = 51460})) then -- chain hand rewards 
			e.self:Say("Well met, ".. e.other:GetCleanName() ..". You may have well disrupted the Muramite chain of command long enough to afford me a chance to go looking for my surviving brothers. The Muramites are on the watch for me, but now they will be scrambling for word from their master. To thank you for your efforts, here are the chain gloves I have promised you."); --need live parse
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70849,100000); -- (70849); # Item: Ragebound Chain Mittens
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70800,100000); -- (70800); # Item: Darkraider's Gloves
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70807,100000); -- (70807); # Item: Spiritkin Mittens
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70765,100000); -- (70765); # Item: Sunrider's Gloves
				end
        


		elseif(item_lib.check_turn_in(e.trade, {item1 = 51445,item2 = 51459,item3 = 51459})) then -- chain wrist rewards 
			e.self:Say("The Blood Standard of Dranik! So it was not destroyed! Well done, ".. e.other:GetCleanName() ..". I make sure this banner remains in the hands of those still loyal to the old ways. May it fly over the free armies of Kuua once again. Here is the wristguard I have promised. May they serve you well in your future battles against the Muramites!");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70848,100000); -- (70848); # Item: Ragebound Chain Wristband
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70799,100000); -- (70799); # Item: Darkraider's Wristguard
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70806,100000); -- (70806); # Item: Spiritkin Bracer
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70764,100000); -- (70764); # Item: Sunrider's Wristguard
				end
        
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51444,item2 = 51458,item3 = 51458})) then -- chain arms rewards 
			e.self:Say("A map of Old Kuua! How this map makes me long for the old days, back when we were a free race! My thanks, ".. e.other:GetCleanName() ..". This map may help relearn the new landscape in the context of the old. Here is a set of ornate arm guards as your reward.");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70847,100000); -- (70847); # Item: Ragebound Chain Sleeves
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70798,100000); -- (70798); # Item: Darkraider's Sleeves
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70805,100000); -- (70805); # Item: Spiritkin Sleeves
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70763,100000); -- (70763); # Item: Sunrider's Sleeves
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51440,item2 = 51454,item3 = 51454})) then -- chain head rewards 
			e.self:Say("Well met, ".. e.other:GetCleanName() ..". Hopefully this book will contain some valuable information on the nature of Discord. To survive on my own, I must first understand the poison affecting the land. As promised, here is the helm as your reward for such a dangerous mission.");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70846,100000); -- (70846); # Item: Ragebound Chain Cap
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70797,100000); -- (70797); # Item: Darkraider's Coif
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70804,100000); -- (70804); # Item: Spiritkin Cap
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70762,100000); -- (70762); # Item: Sunrider's Hat
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51441,item2 = 51455,item3 = 51455,item4 = 51455})) then -- chain chest rewards
			e.self:Say("This is the scepter of Noble Pravel the Diviner! I recognize the markings! I can tell by the way the light has faded that he no longer draws breath. Though this is terrible news, I'm grateful at least you have recovered it from the Muramites. I'll try to smuggle this back to those still loyal to Dranik. Thanks you,".. e.other:GetCleanName() ..". As promised, here is my chain vest. It has grown too cumbersome for me to carry in my wanderings.'");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70851,100000); -- (70851); # Item: Ragebound Chain Chestguard
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70802,100000); -- (70802); # Item: Darkraider's Vest
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70809,100000); -- (70809); # Item: Spiritkin Tunic
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70767,100000); -- (70767); # Item: Sunrider's Vest
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51442,item2 = 51456,item3 = 51456,item4 = 51456})) then -- chain leg rewards 
			e.self:Say("Hmm, I shudder to think what names I will find scribed on this rock, but I thank you for your work none the less. Hopefully, this list can be used to stir some more dissention among the dragorn that have sworn loyalty to Mata Muram for the time being. Here are the chain boots I have promised. May they serve you well, ".. e.other:GetCleanName() ..".");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70852,100000); -- (70852); # Item: Ragebound Chain Legguards
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70803,100000); -- (70803); # Item: Darkraider's Pants
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70810,100000); -- (70810); # Item: Spiritkin Leggings
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70768,100000); -- (70768); # Item: Sunrider's Pants
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51443,item2 = 51457,item3 = 51457})) then -- chain feet rewards 
			e.self:Say("So, the embers do exist! Excellent work, ".. e.other:GetCleanName() ..". I plan to hold this ember in the forge when crafting in the future. This will ensure that the ember's heat is used to forge armor for the enemies of the Muramites. Poetic justice, don't you think? For your efforts, here are the boots as promised!");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70850,100000); -- (70850); # Item: Ragebound Chain Boots
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70801,100000); -- (70801); # Item: Darkraider's Boots
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70808,100000); -- (70808); # Item: Spiritkin Slippers
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70766,100000); -- (70766); # Item: Sunrider's Boots
				end
		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
