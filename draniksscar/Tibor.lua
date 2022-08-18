--Tibor's Chain Armor (Tier 2)   
-- helm,bp,boots,gloves needed to be parsed on live for proper emotes

function event_say(e)
	if (e.other:GetFaction(e.self) <= 1) then -- require ally
		if(e.message:findi("hail")) then
		  e.self:Say("I have been expecting a creature like you for sometime now as I have heard rumors of strangers in our lands. Powerful strangers that, shall we say, do not find the Muramites to be the most tasteful of folk. I am Tibor, former officer from the Dragorn militia. It was my army that held off the Muramites at the wall during those dark days. Many fine warriors under my command [fell] to those that came out of that portal near the wall. Many more in the days after that became infected with the sickness of thought that came from the influence of Discord. Brother turned on brother, friend turned on friend.");
		elseif(e.message:findi("fell")) then
		  e.self:Say("Many of us had no choice but to flee rather than face striking down our own brethren and risk making our enemy stronger. So here I have been, waiting and watching . . . biding my time, gathering information. And now I am ready to put a plan into action. With your help, the dragorn can reclaim their dignity and honor by finding the courage to rise up against our enemy. I cannot promise riches for I only have a few meager pieces of [armor] to trade for your valiance. What say you?");
    elseif(e.message:findi("armor")) then
		  e.self:Say("I have been slowly collecting implements of war, but have not found many weapons due in part to the Muramites destroying most of our forges. What weapons I have I cannot part with as the force I am building needs them. I do, however, have several pieces of chain armor that you may be interested in for helping me solve my [problem].");
    elseif(e.message:findi("problem")) then
		  e.self:Say("The simple fact of the matter is that I cannot risk attracting attention to myself or those I still command and yet I cannot allow the Muramites that remain to do so uncontested. No, we must strike back, but if the Muramites learn that dragorns are behind the attacks, they will crush our resistance. But if someone else were to carry out the attacks they would have no cause to believe it was us. Therefore, in exchange for your help, I will give you several pieces of armor that I have. I have a [helm], a pair of [sleeves], [bracers], a pair of [gloves], a [breastplate], [leggings], and [boots].");
		elseif(e.message:findi("helm")) then
		  e.self:Say("When Discord first impinged upon our world, sentiments of treachery and paranoia crept into our lives. Dragorn turned on dragorn and longstanding friendships ended in bitter squabbling. One dragorn, Noble Yemall the Arcane, kept his wits enough to realize what was happening. Before the Muramites came, Yemall toiled tirelessly to counter the effects of Discord. Although his efforts were ultimately in vain, it is said that he was able to author a treatise before the Muramites seized him. This treatise, entitled The Duskfall Chronicles, contains his reflections on the nature of Discord. No one knows what has happened to this text, but if you are able to recover it, I may be able to understand Discord and avoid mistakes of the past. Bring me this treatise along with two deepshadow feran pelts so that I may make a book cover. Do this for me and I will reward you with my chain coif.");
		elseif(e.message:findi("sleeve")) then
		  e.self:Say("The armies of Mata Muram are but one aspect of Discord's deep shadow. The Darkening ravaged not only the denizens of Kuua, but also the landscape as well. Many of our old landmarks no longer stand and the sky -- once blue and vast -- now seethes with ash and storms. If you can find a map of Old Kuua, one drawn before the coming of Discord, I may be able to use it to find my way again. I have many miles to cover if I am to find my lost men and the terrain looks so alien to me. Return with such a map along with two Kuuan Lodestones so I can make a compass. Your efforts will be rewarded with my chain armwraps. Best of luck.");
		elseif(e.message:findi("bracer")) then
		  e.self:Say("My kin believe that all the dragorn were created by the death of a single dragon, Dranik, the great father. The first dragorn to walk Kuua created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. The last dragorn armies to carry the banner fell to the Muramites. No one can say where the Blood Standard of Dranik has gone, but the recovery of such an artifact would leave me in your debt. Return with this banner along with two shed ikaav skins to hide it in. One of my men, a sergeant named Tibor, used to carry this standard into battle. Although he is probably dead, it would honor his memory if you recovered this standard born by my lost friend. I'd be happy to reward your efforts with my chain bracer.");
		elseif(e.message:findi("glove")) then
		  e.self:Say("Harbinger's Spire was once a dragorn lookout tower which Mata Muram has since claimed and bent to his own purposes. He uses the spire as a beacon to receive news on his domain. Some of his captains possess infused crystal shards which can be used to send up beacons from Harbinger's Spire. Return to me with one of these infused spire control shards along with two darkshorn Kyv hoods. The hoods will help me hide my identity and the crystal shard will produce a break in the Muramite chain of command, allowing me greater freedom . . . at least for a few days. Do this for me and I can reward you with my finely crafted pair of chain gloves.");
		elseif(e.message:findi("breastplate")) then
		  e.self:Say("Before the Muramites came, the Council of Eight ruled over Dranik. The eight nobles, lead by Jelvan the Eldest each carried scepters that were said to be carved from the bones of the first dragorn sons. It is said that these scepters will glow as long as their owner is alive. I have not seen or heard from the council since the Muramites overran our city, but I have heard that these scepters were handed out by Mata Muram. If you can recover one of these scepters along with three ragged discordling skins to hide it in, I can smuggle this relic of the dragorn away from the Muramites. They should not be in control of such a relic. Relieve our enemies of this relic and I can reward you with my chain vest.");
		elseif(e.message:findi("legging")) then
		  e.self:Say("Kuua was not the first world touched by Discord. There have been many others. I know this because I have heard the Muramites tell stories of past conquests. One of the stories they tell is that the last ember of a Discord-ravaged city will burn for many years, long after the ruins of the city itself have been covered over by time. Some say it's the city's spirit slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three locks of a chimera's mane, I can make a charm to bribe my way past any Muramite who may find me. My enemies are everywhere and I need insurance in case they see through my guise. Do this for me and you shall be rewarded with my old chain leggings.");
		elseif(e.message:findi("boot")) then
		  e.self:Say("When Discord first descended upon Kuua, many of my own kin turned traitor. These traitors did considerable damage to our defense efforts for they worked against us without our knowledge. There is talk of a traitors' stone which is etched with the names of all dragorn who conspired with the Muramites in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitors' stones, along with two Muramite dispatches, I can use them to learn who to trust and who to avoid on my quest to find my missing legion. There are many who would turn me in if they knew my true identity, but this stone should help me sort friend from foe. Bring this stone to me and I can reward you with my chain boots.");
    		end
	else
		e.self:Emote("hisses as you approach but does not attack.");

	end
end


function event_trade(e)
	local class = e.other:Class();
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 1 or e.other:GetGM() and (class == "Berserker" or class == "Rogue" or class == "Shaman" or class == "Ranger" or e.other:GetGM())) then -- require ally and chain

		if(item_lib.check_turn_in(e.trade, {item1 = 51475,item2 = 51489,item3 = 51489})) then -- chain helm rewards 
			e.self:Say("Well met, ".. e.other:GetCleanName() ..". You may have well disrupted the Muramite chain of command long enough to afford me a chance to go looking for my surviving brothers. The Muramites are on the watch for me, but now they will be scrambling for word from their master. To thank you for your efforts, here are the chain gloves I have promised you."); --need live parse
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70958,100000); -- (70958); # Item: Wrathbringer's Chain Helm of the Vindicator
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70909,100000); -- (70909); # Item: Whispering Hat of Shadows
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70916,100000); -- (70916); # Item: Ritualchanter's Cap of the Ancestors
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70874,100000); -- (70874); # Item: Bladewhisper Chain Cap of Journeys
				end



		elseif(item_lib.check_turn_in(e.trade, {item1 = 51479,item2 = 51493,item3 = 51493})) then -- chain sleeves rewards 
			e.self:Emote("reaches for the pouch and quickly opens it. He dumps the contents on the ground and quickly rummages through the pile, picking up a folded note and reading it. 'Yes, it turns out my suspicions were correct. This pouch contained two sets of orders, one for the girplan and discordlings, and another set for the dragorn Muramites. Now that I am aware of their plans, I can prepare my forces accordingly. I also thank you for removing some of the ikaav as this will make it easier for my soldiers to move about undetected.");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70959,100000); -- (70959); # Item: Wrathbringer's Chain Sleeves of the Vindicator
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70910,100000); -- (70910); # Item: Whispering Armguard of Shadows
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70917,100000); -- (70917); # Item: Ritualchanter's Armguards of the Ancestors
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70875,100000); -- (70875); # Item: Bladewhisper Chain Sleeves of Journeys
				end

		elseif(item_lib.check_turn_in(e.trade, {item1 = 51480,item2 = 51494,item3 = 51494})) then -- chain bracers rewards 
			e.self:Emote("opens his eyes wide as you hand him the heart that glows with arcane magic. 'Ah, the heart of our enemy', he says holding the heart up to the light. Within the center of the heart you notice what appears to be a small diseased shadow. Tibor violently throws the gem down to the ground and as he grinds it to dust, you hear a faraway scream that sends a shiver down your spine. 'Here is a chain bracer that I myself once wore in battle. May it bring you countless victories.");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70960,100000); -- (70960); # Item: Wrathbringer's Chain Wristguard of the Vindicator
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70911,100000); -- (70911); # Item: Whispering Bracer of Shadows
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70918,100000); -- (70918); # Item: Ritualchanter's Wristband of the Ancestors
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70876,100000); -- (70876); # Item: Bladewhisper Chain Wristband of Journeys
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51481,item2 = 51495,item3 = 51495})) then -- chain glove rewards 
			e.self:Say("Well met, ".. e.other:GetCleanName() ..". Hopefully this book will contain some valuable information on the nature of Discord. To survive on my own, I must first understand the poison affecting the land. As promised, here is the helm as your reward for such a dangerous mission.");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70961,100000); -- (70961); # Item: Wrathbringer's Chain Gloves of the Vindicator
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70912,100000); -- (70912); # Item: Whispering Gloves of Shadows
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70919,100000); -- (70919); # Item: Ritualchanter's Mitts of the Ancestors
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70877,100000); -- (70877); # Item: Bladewhisper Chain Gloves of Journeys
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51476,item2 = 51490,item3 = 51490,item4 = 51490})) then -- chain chest rewards
			e.self:Say("This is the scepter of Noble Pravel the Diviner! I recognize the markings! I can tell by the way the light has faded that he no longer draws breath. Though this is terrible news, I'm grateful at least you have recovered it from the Muramites. I'll try to smuggle this back to those still loyal to Dranik. Thanks you,".. e.other:GetCleanName() ..". As promised, here is my chain vest. It has grown too cumbersome for me to carry in my wanderings.'");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70963,100000); -- (70963); # Item: Wrathbringer's Chain Chestguard of the Vindicator
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70914,100000); -- (70914); # Item: Whispering Tunic of Shadows
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70921,100000); -- (70921); # Item: Ritualchanter's Tunic of the Ancestors
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70879,100000); -- (70879); # Item: Bladewhisper Chain Vest of Journeys
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51477,item2 = 51491,item3 = 51491,item4 = 51491})) then -- chain leg rewards 
			e.self:Say("Ah, the amulet. Yes, this surely belonged to a dragorn noble or perhaps an elder. I can still smell the stink of the Muramite that stole it though. I will see to it that it is returned to the owner or one of his brood. The demise of the architect and the girplan workers will buy our people some time to regroup. For your courageous acts, I will give you these chain leggings that are fit for even the most-skilled dragorn fighter.");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70964,100000); -- (70964); # Item: Wrathbringer's Chain Leggings of the Vindicator
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70915,100000); -- (70915); # Item: Whispering Pants of Shadows
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70922,100000); -- (70922); # Item: Ritualchanter's Leggings of the Ancestors
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70880,100000); -- (70880); # Item: Bladewhisper Chain Legguards of Journeys
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51478,item2 = 51492,item3 = 51492})) then -- chain boots rewards 
			e.self:Say("So, the embers do exist! Excellent work, ".. e.other:GetCleanName() ..". I plan to hold this ember in the forge when crafting in the future. This will ensure that the ember's heat is used to forge armor for the enemies of the Muramites. Poetic justice, don't you think? For your efforts, here are the boots as promised!");
				if class == "Berserker" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70962,100000); -- (70962); # Item: Wrathbringer's Chain Boots of the Vindicator
				end
				if class == "Rogue" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70913,100000); -- (70913); # Item: Whispering Boots of Shadows
				end
				if class == "Shaman" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70920,100000); -- (70920); # Item: Ritualchanter's Boots of the Ancestors
				end
				if class == "Ranger" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70878,100000); -- (70878); # Item: Bladewhisper Chain Boots of Journeys
				end

		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
