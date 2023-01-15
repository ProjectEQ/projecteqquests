--Korshawn's Silk Armor (Tier 1) 

function event_say(e)
	if (e.other:GetFaction(e.self) <= 2) then -- require warmly
		if(e.message:findi("hail")) then
		  e.self:Emote("The old dragorn studies you for a moment before he begins speaking in a low gravely voice, 'So, $name, is it true what my kin whisper? That you have come to fight the Muramites? Hmm, you're ten years too late. Half of Kuua's warriors who would have fought by your side are now nothing more then [bones]. The other half have already sworn allegiance to Mata Muram. I'm not so sure which half is better off.");
		elseif(e.message:findi("bones")) then
		  e.self:Say("Many dragorn have fallen to the armies of the Muramites. As a chaplain of Dranik's forces, it was my responsibility to guide the passing of the dying warriors and bury their bodies so that they will be honored even in death. I buried each member of my unit, one by one, until only I remained. Consumed with despair, I abandoned the war effort to seek a life of solitude and anonymity.' The dragorn gazes off into the distance before continuing, 'Your arrival has been the first hope many of us have had in a long time. I wish I could join you as you make your stand against the Muramites, but I've long ago hung up my battle [heirlooms], swearing never to fight again.");
		elseif(e.message:findi("heirloom")) then
		  e.self:Say("I still have my battle dressings. They are part of an ancient set handed down from Dranik's chaplains before me. Perhaps you'd be interested in cloth armor for your [hands], [wrists], [arms], [head], [chest], [legs], or [feet]? The pieces are light and supple and served me well in the field. I can give you one piece for each service you perform in the interest of the children of Dranik.");
		elseif(e.message:findi("head")) then
		  e.self:Say("Before the Muramites came, the High Council of Eight ruled over Dranik. The eight nobles, lead by Jelvan the Eldest, each carried scepters that were said to be carved from the bones of the first dragorn sons and etched in ancient runes. It is said that these scepters will glow as long as their owner is alive. I have not seen the council since the Muramites overran our city, but I have heard that their scepters were handed out by Mata Muram as war trophies. If you can recover one of these scepters along with three Kuuan oil candles so I can study the runes, I will reward you with my former battle tunic!");
		elseif(e.message:findi("arm")) then
		  e.self:Say("I respect your willingness to help, but this will not be an easy task. As you may know, the armies of Mata Muram are but one aspect of Discord's deep shadow. The Darkening ravaged not only the denizens of Kuua, but also the landscape as well. Many of our old landmarks no longer stand, and the sky -- once blue and vast -- now seethes with ash and storms. If you can find a map of Old Kuua, one drawn before the coming of Discord, it may help me to infer the location of the ancient barrows of my kin. I need to find them before the Muramites manage to pillage the graves of my ancestors. Return with one of the old maps as well as two jagged noc tusks so I can hollow them out and create a safe place to keep the map. Do this for me and I can reward your efforts with my cloth arm wraps.");
		elseif(e.message:findi("wrist")) then
		  e.self:Say("We were created by a single great dragon, the great father known as Dranik. The first dragorn created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. This banner was carried by my kin through many battles and it has seen us through much strife. The last dragorn armies to carry the banner fell to the Muramites over a decade ago. No one can say where the Blood Standard of Dranik's Sons has gone, but the recovery of such an artifact will leave me in your debt. Return with this banner along with two hooked chimera claws to use as nails. I will ensure that the standard hangs over the mass graves of those who died fighting the Muramites. It's the least I can do to honor their deaths.");
		elseif(e.message:findi("hand")) then
		  e.self:Say("Harbinger's Spire was once a dragorn lookout tower which the Muramites have since bent to their own purposes. I studied there as a young chaplain, and I shudder to look upon what has those discordlings have done to it in these past years. Mata Muram uses the spire as a beacon to receive the tidings of his domain. Some of his captains possess crystal shards which can be used to control the beacon rising from Harbinger's Spire. If you are able to steal one of these crystals, it would mean a break in the Muramite chain of communication. Return with one of these spire control shards as well as two discordling finger bones. If enough shards are taken from the Muramites, they will be forced to abandon the tower.");
		elseif(e.message:findi("chest")) then
		  e.self:Say("Just before my master was marched through the causeway with the other nobles, he was very busy writing and receiving important communications from other elders. In fact, just a few days prior to being taken, he told me that he was expecting a note that could change the very face of the war. The carrier of this message was none other than Jayruk himself. No one knows what happened to Jayruk because he did not show up with the note. I will give you my master's ceremonial robe if you can find Jayruk's vest and bring it back to me. I am sure that hidden within it lies the note my master was so anxious about. In addition, I will need three pieces of Vrenlar fruit which I will need to uncover the hidden message.'");
		elseif(e.message:findi("leg")) then
		  e.self:Say("As you may know, Kuua was not the first world touched by Discord. There have been many others, for I have heard the Muramites tell stories of past conquests. One of the stories they tell is that the last ember of a Discord-ravaged city will burn for many years long after the ruins of the city itself have been buried by time. Some say it's the city's spirit slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three Dragorn Muramite insignia necklaces, I can reward you with my former battle leggings. I have no need of them any longer, and I can use that ember to light the pyres of my kin who have fallen to the Muramites. It would be an honorable tribute to both my kin and the unknown city that have both fallen to Discord.");
		elseif(e.message:findi("feet")) then
		  e.self:Say("When Discord first descended upon Kuua, many of my own kin turned traitor. There is talk of a traitors' stone, etched with the names of all dragorn who conspired with the enemy in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitor stones, along with two ikaav braids so I can hang the stones for all to see, it may enrage the remaining dragorn who are unhappy with Mata Muram's rule. In time they may gather the spirit of will to once again rise up against the Muramites. Your reward shall be the cloth slippers I wore back when I, too, fought against the enemies of Dranik.");
    		end
	else
		e.self:Emote("hisses at you.");

	end
end


function event_trade(e)
	local class = e.other:Class();
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 2 or e.other:GetGM() and (class == "Magician" or class == "Enchanter" or class == "Wizard" or class == "Necromancer" or e.other:GetGM())) then -- require warmly and int casters
		
		if(item_lib.check_turn_in(e.trade, {item1 = 51446,item2 = 51474,item3 = 51474})) then -- int hands rewards
			e.self:Emote("bows before you. 'Thank you, ".. e.other:GetCleanName() ..". You have helped prevent the Muramites from using my former home as part of their information network. You've also brought me the fingers of two discordlings, the very beasts that are responsible for the tower's construction. As promised, I offer my cloth gloves as your reward.");
				if class == "Enchanter" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70835,100000); -- (70835); # Item: Charmweaver's Mittens
				end
				if class == "Wizard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70821,100000); -- (70821); # Item: Spelldeviser's Cloth Gloves
				end
				if class == "Magician" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70828,100000); -- (70828); # Item: Runemaster's Gloves
				end
				if class == "Necromancer" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70814,100000); -- (70814); # Item: Deathcaller's Gloves
				end


		elseif(item_lib.check_turn_in(e.trade, {item1 = 51445,item2 = 51473,item3 = 51473})) then -- int wrist rewards
			e.self:Say("You've recovered the banner! And to think I thought it lost for good! I'll be sure this flies over the graves of my fallen kin. May its glory rekindle the spirits of the dragorn still under the Muramite whip! As promised, my cloth wrist band shall be your reward!");
				if class == "Enchanter" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70834,100000); -- (70834); # Item: Charmweaver's Bracer
				end
				if class == "Wizard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70820,100000); -- (70820); # Item: Spelldeviser's Cloth Wristband
				end
				if class == "Magician" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70827,100000); -- (70827); # Item: Runemaster's Wristband
				end
				if class == "Necromancer" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70813,100000); -- (70813); # Item: Deathcaller's Wristguard
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51444,item2 = 51472,item3 = 51472})) then -- int arms rewards
			e.self:Say("You've recovered a map of Old Kuua! With this I may yet find the burial grounds of my ancestors. Hopefully before the Muramites get there to pillage what remains of my kins' riches! Thank you, $name. As promised, here are my former arm wraps. I have no more need of them, but I'm sure they will serve you well.");
				if class == "Enchanter" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70833,100000); -- (70833); # Item: Charmweaver's Armguards
				end
				if class == "Wizard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70819,100000); --  (70819); # Item: Spelldeviser's Cloth Sleeves
				end
				if class == "Magician" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70826,100000); -- (70826); # Item: Runemaster's Sleeves 
				end
				if class == "Necromancer" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70812,100000); -- (70812); # Item: Deathcaller's Armbands
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51440,item2 = 51468,item3 = 51468})) then -- int head rewards
			e.self:Say("You've recovered The Duskfall Chronicles! Perhaps with time the dragorn will learn to resist the poison of Discord to once again stand against a common enemy. May so many of my kin never die in vain again. Thank you, $name. As promised, here is my cloth battle hood as your reward.");
				if class == "Enchanter" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70832,100000); -- (70832); # Item: Charmweaver's Cap
				end
				if class == "Wizard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70818,100000); -- (70818); # Item: Spelldeviser's Cloth Hat
				end
				if class == "Magician" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70825,100000); -- (70825); # Item: Runemaster's Cap
				end
				if class == "Necromancer" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70811,100000); -- (70811); # Item: Deathcaller's Skullcap
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51441,item2 = 51469,item3 = 51469,item4 = 51469})) then -- int chest rewards
			e.self:Say("Yes, this is it the scepter of Yumall! I recognize the markings! Alas, the glow has left the scepter which means Yumall no longer draws breath. At least now I know to prepare a burial ritual in his honor. As promised, here is my former battle tunic. In the days when I still fought for Dranik, this tunic turned many blades that otherwise would have found my heart.");
				if class == "Enchanter" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70837,100000); -- (70837); # Item: Charmweaver's Robe
				end
				if class == "Wizard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70823,100000); -- (70823); # Item: Spelldeviser's Cloth Robe
				end
				if class == "Magician" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70830,100000); -- (70830); # Item: Runemaster's Robe
				end
				if class == "Necromancer" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70816,100000); -- (70816); # Item: Deathcaller's Robe
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51442,item2 = 51470,item3 = 51470,item4 = 51470})) then -- int leg rewards
			e.self:Say("You've recovered a Dragorn City Ember! With this I may yet find the burial grounds of my ancestors. Hopefully before the Muramites get there to pillage what remains of my kins' riches! Thank you, ".. e.other:GetCleanName() ..". As promised, here are my former leggings. I have no more need of them, but I'm sure they will serve you well."); --text made up
				if class == "Enchanter" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70838,100000); -- (70838); # Item: Charmweaver's Leggings
				end
				if class == "Wizard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70824,100000); -- (70824); # Item: Spelldeviser's Cloth Britches
				end
				if class == "Magician" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70831,100000); -- (70831); # Item: Runemaster's Pants
				end
				if class == "Necromancer" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70817,100000); -- (70817); # Item: Deathcaller's Pants
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51443,item2 = 51471,item3 = 51471})) then -- int feet rewards
			e.self:Say("Excellent work, ".. e.other:GetCleanName() ..". I shudder to think what names could be etched on this stone, but I thank you for your efforts nonetheless. As promised, here are my slippers as your reward. May they keep you fleet of foot and out of harm's way.");
				if class == "Enchanter" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70836,100000); -- (70836); # Item: Charmweaver's Slippers
				end
				if class == "Wizard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70822,100000); -- (70822); # Item: Spelldeviser's Cloth Shoes
				end
				if class == "Magician" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70829,100000); -- (70829); # Item: Runemaster's Boots
				end
				if class == "Necromancer" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70815,100000); -- (70815); # Item: Deathcaller's Slippers
				end
		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
