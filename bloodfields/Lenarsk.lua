--Lenarsk's Leather Armor (Tier 2)

function event_say(e)
	if (e.other:GetFaction(e.self) <= 1) then -- require ally
		if(e.message:findi("hail")) then
		  e.self:Say("Hail to you stranger. Though I must be careful, I now know that you are sympathetic to our plight. I, Lenarsk, was a most-favored tailor to the nobles and famous hunters. They would come from far away seeking my shop, clamoring for my wares. But alas, the Muramites changed all of this when they infected our lands. Fate can be harsh at times. And yet here you are. Perhaps our mutual goals will encourage us to walk the same [path] together.");
		elseif(e.message:findi("path")) then
		  e.self:Say("By now it is apparent that I hold no favor toward those Muramites and I also know that you don't look upon them kindly either. Therefore, I have a proposition for you. I know that you alone will not be enough to rid our lands of these invaders, but any sorrow you can cause them will bring me unending joy. Help me in my cause to wound the Muramites and I will repay your courageous deeds with some of my unfulfilled [orders].");
    elseif(e.message:findi("order")) then
		  e.self:Say("Why, as I said, customers from many lands would seek me out to create handsome one-of-a-kind pieces. I'm sure I still have a few of these left waiting for owners that will never arrive. Yes, I believe I have something for your [head], [arms], [wrists], [hands], [chest], [legs], and [feet]. I will give these to you if you help me.");
		elseif(e.message:findi("head")) then
		  e.self:Say("I have a wonderfully woven cap that was meant for the son of a noble. Alas, both father and son fell victim to the wicked Muramites and were forcibly marched through the causeway to their deaths. In exchange for the cap, I seek the walking stick of a certain dragorn elder that also perished during the march. I have heard rumors that the stick was enchanted such that were it to be lost it would find its way back to its owner. You must bring back Patorav's walking stick to me. Also, the Muramite guards that gleefully killed our leaders were given awards. Find me two Muramite Noble's March awards as well.");
		elseif(e.message:findi("arm")) then
		  e.self:Say("When the Muramites invaded, some took over my shop and either stole or destroyed everything. Why, I even lost a beautiful leather pouch I had been creating for one in my family. I can't stand the thought of that Muramite with a gift meant for a loved one. Please return this pouch to me so I know that my hard work did not benefit one as evil as a Muramite. I also ask of you to bring me back two spiked discordling collars so I know that at least some of those that destroyed my shop have been dealt with.");
		elseif(e.message:findi("wrist")) then
		  e.self:Say("Very little is known to us about the riftseekers. We do know they do wield powerful magic that can create portals that have appeared in our lands. I believe they are wholly creatures of magic. I have heard whispers that the heart of these beings is not the heart of a mundane beast. No, in fact, I have heard that their heart is pure magic. Bring me one of these hearts so I may find out if any of the magic within it may be used to enchant the pieces of leather raiment I create. In addition I am running low on quality feran hides so I will need you to bring me back a couple of those as well.");
		elseif(e.message:findi("hand")) then
		  e.self:Say("I have a pair of gloves that has the suppleness of leather, but the strength of iron! I am willing to part with these if you retrieve an artifact. Find the axe that was once wielded by Makyah the Fierce. Never did a more magnificent warrior stride the field of battle and when he was lost, so was a large portion of my people's hopes. Return the axe to me so that once my people see that it was found, we may find the hope and courage necessary to defeat our foes. You will also need to bring me two fine chimera hides so I may craft a sheath worthy of an axe wielded by a legend.");
		elseif(e.message:findi("chest")) then
		  e.self:Say("As celebrated as I am as a master crafter, my mentor was so much more. One of the last pieces he created before passing away was a vest for Jayruk the Hunter. Many times did Jayruk narrowly cheat death, not by the strength of spear or swiftness of bow, but by the sharpness of his mind. There was a time when a trap they laid for a pack of feral bazu failed to contain them. Enraged, the bazu began a charge toward some homes and would have surely decimated all in their path were it not for Jayruk's [quick thinking].");
    elseif(e.message:findi("quick thinking")) then
		  e.self:Say("He quickly managed to anger the lead bazu and trick the pack into following him. Blinded by rage, the pack charged after Jayruk as he led through them a narrow ravine. Hidden by brush was a long drop which Jayruk managed to avoid by deftly jumping to one side and clinging onto the cliff face as the bazu fell one by one to their demise. A few days later though, Jayruk disappeared without a trace. Find and return this vest so that I may study the technique that created it. In addition, to honor the memory of Jayruk, bring me three bracelets made out of bazu nails.");
		elseif(e.message:findi("leg")) then
		  e.self:Say("After our forces fell and the Muramites swept through our lands, they pillaged everything in sight. They stormed into my home and shop, stealing what they could and destroying everything else. One particularly nasty Muramite took great pleasure in the destruction of my home. I want you to seek it out and exact revenge. You will recognize him by an amulet he proudly wears. Return to me with this as proof that you have accomplished the task I have lain out for you. Three of the henchmen with this Muramite leader were disgusting discordlings that tormented me needlessly. See to it that this trio pays for their twisted deeds by also bringing me three discordling hooves.");
		elseif(e.message:findi("feet")) then
		  e.self:Say("I had a customer who was a famous hunter in his day. Though not the most celebrated hunter I've served, Vrago was still widely recognized as a hero for tirelessly protecting our people from the wild beasts that roam our lands. He and his cadre once saved my life as I was returning from a trip. As repayment for saving my life, I was creating some boots for him. Before I could fulfill my debt to him, the Muramites captured him and tortured him in their twisted Proving Grounds. I have been told by witnesses to this horror that the one that carried out his execution was awarded a cruelty medal for capturing him. Find the bearer of this medal and repay my debt to Vrago by dispatching him. Return the medal to me and I will give you the boots I had intended for him. To complete the boots though, I will also need two chimera gut strings.");
    		end
	else
		e.self:Emote("hisses as you approach but does not attack.");

	end
end


function event_trade(e)
	local class = e.other:Class();
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 1 or e.other:GetGM() and (class == "Monk" or class == "Beastlord" or class == "Druid" or e.other:GetGM())) then -- require ally and leather
		
		if(item_lib.check_turn_in(e.trade, {item1 = 51481,item2 = 51502,item3 = 51502})) then -- leather hand rewards
			e.self:Say("I can scarcely believe that the axe has been found!  And in such good shape!  It hardly even appears used. Truly the smith that crafted it was quite gifted.  I will give the axe to our remaining elders.  But before I do this, I will take the hides you brought me and will create a sheath to match the axe.  I am sure the elders will sing your praises for your efforts performed on our behalf.  Here are the gloves I spoke about earlier.'");
			e.other:AddEXP(100000);
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70898,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70954,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70891,100000); -- Item: 
				end


		elseif(item_lib.check_turn_in(e.trade, {item1 = 51480,item2 = 51501,item3 = 51501})) then -- leather wrist rewards 
			e.self:Say("Thank you for your effort.  After I spend some time examining the heart, I will know what value the enchantments may hold.  And these hides are certainly of a high enough quality for my needs.  Here is a leather bracer of a design that Jayruk fancied.'");
			e.other:AddEXP(100000);
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70897,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70953,100000); -- Item:
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70890,100000); -- Item:
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51479,item2 = 51500,item3 = 51500})) then -- leather arms rewards
			e.self:Say("Yes the pouch!  Though the war claimed the life of the young one I was going to give this to, at least I can rest easier knowing that a vile Muramite does not have it.  And the two collars you gave me prove to me that you have killed a few of them.  I thank you and in return for your trouble, I shall give you these woven arms that have some very unique enchantments.'");
			e.other:AddEXP(100000);
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70896,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70952,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70889,100000); -- Item: 
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51475,item2 = 51496,item3 = 51496})) then -- leather head rewards
			e.self:Emote("eyes open wide as you hand him the stick and awards.  'Ah, truly this is no mere walking stick.  Why if I listen carefully I can hear the crackling energies within the shaft straining to free itself.  It appears I was wrong about the strap though as it seems to be simply a mundane piece of leather without the benefit of enchantment.  Still I will honor my bargain and know that you have at least dealt a blow to the invaders.  Here is the cap I spoke about earlier.'");
			e.other:AddEXP(100000);
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70895,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70951,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70888,100000); -- Item: 
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51476,item2 = 51497,item3 = 51497,item4 = 51497})) then -- leather chest rewards 
			e.self:Emote("unfolds the vest and begins to run his eyes over it, paying attention to details that only a master crafter would see. 'Yes, this is indeed the vest my master created for Jayruk. I would recognize it anywhere. Now, perhaps I may learn some of the secrets my mentor did not have time enough to pass along to me. And the nails you have brought me pay tribute to the great hunter that Jayruk was. Though this vest I am about to give you is not the equal of the one Jayruk wore, it is certainly close.");
			e.other:AddEXP(100000);
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70900,100000); -- Item:
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70956,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70893,100000); -- Item: 
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51477,item2 = 51498,item3 = 51498,item4 = 51498})) then -- leather leg rewards
			e.self:Emote("nods approvingly as he spies the amulet dangling from your outstretched hand.  'Yes, this surely is the amulet that fiend wore that night.  I will do my best to discover who this owner was and return it to him as I merely sought proof of the thief's demise.  Here are some leather leggings that were commissioned by a frequent customer of mine.  It saddens me to say that he perished at the battle of the wall before I managed to finish them.");
			e.other:AddEXP(100000);
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70901,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70957,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70894,100000); -- Item: 
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51478,item2 = 51499,item3 = 51499})) then -- leather feet rewards 
			e.self:Say("Yes, this surely must be the medal earned by the Muramite that captured Vrago. He will no longer threaten any of my people and for that I thank you. It will be but a moment as I use the gut strings you gave me to finish tailoring the boots to you. Yes, here, I am sure you will be most pleased by the service they provide you.");
			e.other:AddEXP(100000);
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70899,100000); -- Item:
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70955,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70892,100000); -- Item: 
				end
		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
