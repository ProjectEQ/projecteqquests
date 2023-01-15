--Trelak's Plate Armor (Tier 2)  

function event_say(e)
	if (e.other:GetFaction(e.self) <= 1) then -- require ally
		if(e.message:findi("hail")) then
		  e.self:Say("Greetings stranger. What can I, Trelak do for you? Surely you are the strangers that I have heard whispers about . . . the ones that have struck back against our enemies? Perhaps we can aid each other? I am an armor smith that has crafted many fine pieces for the more prestigious officers in the dragorn militia. Many of these pieces have unique magical qualities that I crafted into them. If you are [willing] to recover them, I can recapture most of this magic and create new pieces for you.");
		elseif(e.message:findi("willing")) then
		  e.self:Say("Good, very good. When The Darkening came upon us, I could see by the ferocity and viciousness of the invaders that they would not be easy to defeat. So I took as much as I could and hid out here preparing for the time when our warriors would have need of me. If you help me, I will craft superior pieces of plate armor fit for our mightiest fighters for you. I can provide a [helm], [sleeves], [bracers], a pair of [gloves], a [breastplate], some [leggings], and a pair of [boots].");
		elseif(e.message:findi("helm")) then
		  e.self:Say("Before I can make you a plate helm worthy of Makyah himself, I will need you to bring me some food. I was so busy with taking all of my tools that I did not have time to stock myself with enough sustenance to see me through this ordeal. From time to time I have seen kvy archers eating from a small food sack. I think if you bring me two of these sacks I can continue my work for quite awhile. Your main task though will be to bring me a certain piece of metal I have long had my eye on. There was a certain dragorn elder by the named of Patorav, a wiser and kinder noble did not exist. Wherever he went, he always carried with him a fine [walking stick].");
		elseif(e.message:findi("sleeve")) then
		  e.self:Say("Though I managed to bring nearly all of my tools before the Muramites overran our lands, I did forget to bring the enchanted tongs my mentor gave me. I secretly returned only to watch the Muramites destroy my shop and steal what was left. I saw the leader of this pack of dark thieves place my tongs in an embossed leather sack . . . Which was probably stolen as well. I want you to bring me this sack so I may retrieve my tongs and perhaps other possessions he stole from me. I also want you to repay those brutes for wrecking my shop and home. Bring me back two noc right hands so I know they will no longer steal from me or my people ever again.");
		elseif(e.message:findi("bracer")) then
		  e.self:Say("As a smith I am always looking for new materials and techniques to improve my craft. Many times we come across objects that are highly magical in nature and often we are able to capture this mystical essence and reuse it for our own purposes. The riftseekers have something I very much want. It was these very same beings that betrayed my people to the Muramites, but that is not important now. I know that the riftseeker's heart is not akin to a heart that beats within you or me. It is magical. Find and bring me one of those hearts. Your must also bring me two large pieces of Kuuan Ore as my stock is running a bit low. Return with these and I will make you a bracer much like the ones dragorn warriors wear into battle.");
		elseif(e.message:findi("glove")) then
		  e.self:Say("One of my people's most famous warriors was Makyah the Fierce, who had no equal when it came to the battle arts. Enemies would routinely pause momentarily when he strode upon the field. After the portal exploded though, no trace of Makyah was found. I am more interested in his axe though, which may yet hold salvation for my people. It is my hope that the enchantments and techniques used to create the axe might be used for other purposes. Find and return Makyah's axe to me so I may use it to help my people. To remove the enchantments properly though, I will also need two yearning crystals. With the proper ceremony, gems such as these can be used to transfer charms from one object to another. Come back when you have recovered these and I will give you a pair of gloves that I was crafting in honor of a dragorn elder.");
		elseif(e.message:findi("breastplate")) then
		  e.self:Say("Many good friends and loved ones perished in the invasion. One of my good friends was a famous hunter, Jayruk. He and I went on many hunting expeditions together protecting our lands from some of the more wild and dangerous beasts. I was not skilled enough to take care of a bazu mind you, but at least I could remove the threat of a few murkgliders. Jayruk, however, had no equal. I could regale you for hours of tales of how he narrowly escaped death, but I shan't waste time. Simply know that I wish to pay my respects to my good friend and for this I require the hunting vest he so loved. I will also need three dragorn ceremonial candles too. Return to me with the vest and the three candles and I will give you a plate breastplate that I was crafting for myself.");
		elseif(e.message:findi("legging")) then
		  e.self:Say("When I tried to go back to my shop to retrieve my tongs, I found it overrun with a mob of thieving Muramites. At that moment I, a mere smith, vowed revenge for destroying what it took me a lifetime to build. I did not know how or when I would accomplish this until I crossed paths with you. You will be my instrument, exacting the revenge I cannot achieve on my own. Find the leader of this particular group of Muramites and repay it ten fold. Return to me with the medal it smugly wore -- a medal it no doubt stole from some other hapless dragorn. You also must bring me three blackened discordling tails as proof that the rest of this group has been slain as well. Do this and I will give you a pair of plate leggings that I have been working on for some time now.");
    elseif(e.message:findi("walking stick")) then
		  e.self:Say("This was no ordinary walking stick. The top held a jewel of some mystery for I would always see Patorav whispering to it, but I am more interested in the bottom tip, for it you see was sheathed in a strange metal. I witnessed Patorav striking the ground with the tip only to see it penetrate any surface it encountered. The hardest stone, the most durable metal, nothing could withstand his walking stick. Thus, I have always held an interest in it as the enchantments contained therein may prove to be beneficial to my craft. Though Patorav fell during the noble's march through the causeway, his stick may yet exist. Find it and bring it back with the food and I'll reward you.");
		elseif(e.message:findi("boot")) then
		  e.self:Say("As much of my customers were dragorn warriors, over time I came to befriend many of them. Though most of them perished during the fighting, some were captured by the Muramites and tormented in their Proving Grounds. This was once a serene place where our elders would meditate . . . A place of peace and tranquility that my people looked toward Dranik's spirit for guidance. Now it is a place inhabited by the foulest horrors where resistant dragorns are tortured. One such dragorn was a noble warrior named Ethask. Thrown into the labyrinth unarmed, he fought off a horde of discordlings and kyvs, breaking their bodies with his bare hands. Seriously wounded, he still managed to find an exit through sheer force of will. Just as he was about to exit that black pit, a soaring [Muramite] cowardly struck him down from behind. Mortally wounded with the axe still lodged between his shoulders, Ethask crawled through the exit only to perish on the other side.");
    elseif(e.message:findi("muramite")) then
		  e.self:Say("I know little of this particular Muramite save that he received a medal for his dastardly deeds. Find and slay this Muramite so the spirit of Ethask may find the peace it longs for. Return once you have done this with the Muramite Cruelty Medal as proof that this monster shall trouble my people no more. Also bring me two kyv hunter rings to celebrate Ethask's victories.");
    		end
	else
		e.self:Emote("hisses at you.");

	end
end


function event_trade(e)
	local class = e.other:Class();
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 1 or e.other:GetGM() and (class == "Warrior" or class == "Paladin" or class == "Shadow Knight" or class == "Bard" or class == "Cleric" or e.other:GetGM())) then -- require ally and plate

		if(item_lib.check_turn_in(e.trade, {item1 = 51475,item2 = 51482,item3 = 51482})) then -- plate helm rewards
			e.self:Say("reaches out hungrily for the food sacks and the walking stick. 'Yes, this is Patorav's. I would recognize it anywhere. You can see just by looking at the metal that it hides some source of power. Why its appearance alone... how the metal looks as if it is reflecting moving storm clouds... fascinating. I most graciously thank you for this and the sacks of food. I had nearly finished this plate helm for a customer of mine, but I have heard he met a valiant end at the wall. Wear it honorably as he would have.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70853,100000); -- Item: (70853); # Item: Gladiator's Plate Helm of War
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70867,100000); -- Item: (70867); # Item: Dawnseeker's Coif of the Defender
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70881,100000); -- Item: (70881); # Item: Duskbringer's Plate Helm of the Hateful
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70902,100000); -- Item: (70902); # Item: Farseeker's Plate Helm of Harmony
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70860,100000); -- Item: (70860); # Item: Faithbringer's Cap of Conviction
				end


		elseif(item_lib.check_turn_in(e.trade, {item1 = 51479,item2 = 51486,item3 = 51486})) then -- plate ARMS rewards 
			e.self:Say("takes the items from you before handing you your armplates."); --made up need live parse
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70854,100000); -- Item: (70854); # Item: Gladiator's Plate Sleeves of War
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70868,100000); -- Item: (70868); # Item: Dawnseeker's Sleeves of the Defender
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70882,100000); -- Item: (70882); # Item: Duskbringer's Plate Armguards of the Hateful
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70903,100000); -- Item: (70903); # Item: Farseeker's Plate Armbands of Harmony
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70861,100000); -- Item: (70861); # Item: Faithbringer's Armguards of Conviction
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51480,item2 = 51487,item3 = 51487})) then -- plate bracer rewards
			e.self:Say("widens his eyes as you hand him the riftseeker heart. As you hand it to him, his eyes fix on the small pulsing light within the center of the gem. 'Yes, I am sure I can make good use of this. You have done well. And these pieces of ore will help replenish my supply. For your hard work, here is the plate bracer I spoke of earlier.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70855,100000); -- Item: (70855); # Item: Gladiator's Plate Bracer of War
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70869,100000); -- Item: (70869); # Item: Dawnseeker's Wristguard of the Defender
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70883,100000); -- Item: (70883); # Item: Duskbringer's Plate Wristguard of the Hateful
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70904,100000); -- Item: (70904); # Item: Farseeker's Plate Wristguard of Harmony
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70862,100000); -- Item: (70862); # Item: Faithbringer's Wristband of Conviction
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51481,item2 = 51488,item3 = 51488})) then -- plate glove rewards 
			e.self:Say("holds the axe up and begins to take a few mighty swings through the air in front of him. 'Yes, the axe of the fierce one himself. It will be a shame to remove some of these enchantments, but I am sure I can put them to better use for my people. I will use the two crystals you have just given me to safely remove some of the charms within the axe and put them in some of my newer designs. Here are the plate gloves I spoke of earlier.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70856,100000); -- Item: (70856); # Item: Gladiator's Plate Gloves of War
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70870,100000); -- Item: (70870); # Item: Dawnseeker's Mitts of the Defender
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70884,100000); -- Item: (70884); # Item: Duskbringer's Plate Gloves of the Hateful
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70905,100000); -- Item: (70905); # Item: Farseeker's Plate Gloves of Harmony
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70863,100000); -- Item: (70863); # Item: Faithbringer's Gloves of Conviction
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51476,item2 = 51483,item3 = 51483,item4 = 51483})) then -- plate chest rewards 
			e.self:Say("Ah, yes, this is the vest I saw Jayruk wear so often when times were brighter. No one knows what happened to him, but this vest confirms my greatest fear -- that he met with an untimely end. I thank you for returning this to me so I may pay my respects to my greatest friend. Here is the breastplate I spoke of earlier. I was crafting this for myself, but in times such as these, it is better that it serve a true fighter such as yourself than a mere smith pretending to be one.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70858,100000); -- Item: (70858); # Item: Gladiator's Plate Chestguard of War
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70872,100000); -- Item: (70872); # Item: Dawnseeker's Chestpiece of the Defender
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70886,100000); -- Item:(70886); # Item: Duskbringer's Plate Chestguard of the Hateful
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70907,100000); -- Item: (70907); # Item: Farseeker's Plate Chestguard of Harmony
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70865,100000); -- Item: (70865); # Item: Faithbringer's Breastplate of Conviction
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51477,item2 = 51484,item3 = 51484,item4 = 51484})) then -- plate leg rewards 
			e.self:Emote("smiles and nods approvingly as you hand him the medal and tails. 'Yes this is the amulet that fiendish Muramite wore. And you managed to slay the discordlings as well? Good. Now at least I may rest easier knowing that the fiends will trouble my people no more. Here are the leggings I spoke of earlier. I crafted them using a new technique I developed after my mentor's passing. Now I feel they are ready to be tested on the field of battle. I am certain they will give you much service.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70859,100000); -- Item: (70859); # Item: Gladiator's Plate Legguards of War
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70873,100000); -- Item: (70873); # Item: Dawnseeker's Leggings of the Defender
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70887,100000); -- Item: (70887); # Item: Duskbringer's Plate Legguards of the Hateful
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70908,100000); -- Item: (70908); # Item: Farseeker's Plate Legguards of Harmony
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70866,100000); -- Item: (70866); # Item: Faithbringer's Leggings of Conviction
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51478,item2 = 51485,item3 = 51485})) then -- plate boots rewards
			e.self:Say("Ah, the medal and two rings I spoke of.  You have done a fine job of accomplishing the task I laid out before you.  I will give both the medal and the rings to Ethask's brood... the medal so they will know that their loved one's killer has been slain and the rings so they may celebrate his victories.  In honor of my friend, Ethask, I have crafted these boots.  Wear them with the same courage and honor he displayed.");
				if class == "Warrior" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70857,100000); -- Item: (70857); # Item: Gladiator's Plate Boots of War
				end
				if class == "Paladin" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70871,100000); -- Item: (70871); # Item: Dawnseeker's Boots of the Defender
				end
				if class == "Shadow Knight" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70885,100000); -- Item: (70885); # Item: Duskbringer's Plate Boots of the Hateful
				end
				if class == "Bard" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70906,100000); -- Item: (70906); # Item: Farseeker's Plate Boots of Harmony
				end
        if class == "Cleric" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70864,100000); -- Item: (70864); # Item: Faithbringer's Boots of Conviction
				end

		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
