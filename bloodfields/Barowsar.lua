--Barowsar's Leather Armor (Tier 1)

function event_say(e)
	if (e.other:GetFaction(e.self) <= 2) then -- require warmly
		if(e.message:findi("hail")) then
		  e.self:Say("Greetings, ".. e.other:GetCleanName() ..". I have heard your name spoken among the few dragorn that find their way here to visit Master [Lenarsk]. They say you are an enemy of the Muramites? If so, then let me greet you properly.' The dragorn bows deeply. 'Apprentice Tanner Barowsar at your service.");
		elseif(e.message:findi("lenarsk")) then
		  e.self:Say("A decade ago my forge created great suits of armor to protect Kuua's strongest warriors. When the Muramites came, however, they sought to conscript me to make armor for their captains. Rather than comply, I fled into the wilderness to live as an exile. I have no regrets about my decision, but I do long for the old days, back when the land was green and the dragorn stood side by side against their enemies, instead of kowtowing to these forsaken Muramites. There many tasks I need accomplished that I am unable to see through myself due to my exile. If you can help me, I can reward you with finely crafted plate armor for your [hands], [wrists], [arms], [head], [chest], [legs], or [feet]. What say you?");
		elseif(e.message:findi("head")) then
		  e.self:Say("I was too young to remember fully, but when Discord first impinged upon our world, treachery and paranoia crept into the lives of my kin. Only one dragorn, Noble Yemall the Arcane, kept his wits long enough to realize what was happening. Yemall toiled tirelessly to counter the effects of Discord. Although his efforts were in vain, it is said that he was able to author a treatise before the Muramites seized him. This treatise, entitled The Duskfall Chronicles, contains his reflections on the nature of Discord. No one knows what has happened to this text, but if you are able to recover it, I can study its teachings and perhaps begin to understand why so many of my kin turned on one another. Bring me this treatise along with two Muramite ritual scrolls to help me understand the nature of Discord. Do this and I can reward you with a leather helm from Master Lenarsk's collection.");
		elseif(e.message:findi("arm")) then
		  e.self:Say("I have little memory of Kuua before the Muramites came. I was but a hatching when they began to pour into our lands. I have heard stories though, stories of green mountains and fields of Dansk blossoms. If only I could see it all now. If you can find a map of Old Kuua, one drawn before the coming of Discord, I would like to study it to remind myself that this land was not always twisted by Discord. Bring me one of these maps along with two Dansk blossoms so that I may imagine the world of my elders. Do this and I can reward you with an ornate pair of leather armguards from Master Lenarsk's collection.");
		elseif(e.message:findi("wrist")) then
		  e.self:Say("As you may know, my kin believe that all the dragorn were created by the death of a single dragon, Dranik -- the great father. The first dragorn to walk Kuua created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. The last dragorn armies to carry the banner fell to the Muramites. No one can say where the Blood Standard of Dranik has gone, but the recovery of such an artifact would leave me in your debt. If you return with this banner as well as with two Dansk branches, I can remake a haft for this standard to fly again. In return, I can offer a finely crafted leather wristguard as your reward.");
		elseif(e.message:findi("hand")) then
		  e.self:Say("As you may know, Harbinger's Spire was once a dragorn lookout tower which Mata Muram has since claimed and bent to his own purposes. He uses the spire as a beacon to receive news on his domain. Some of his captains possess infused crystal shards which can be used to send up beacons from Harbinger's Spire. Return to me with one of these spire control shards as well as two glistening murkglider pelts to hide it in. I have heard rumors of a small force of dragorn in Dranik's Scar that still stand against Mata Muram. If we can disrupt the Muramite communication network, we may buy these rebels time to plan their next attack. It's a small thing, but until I am old enough to fight, it's the best I can do to help them. In return for your help I will reward you with a masterwork set of leather gloves.");
		elseif(e.message:findi("chest")) then
		  e.self:Say("One of my greatest regrets stems from the fact that I only have vague memories of my father, Jelvan the Eldest. I have not seen him since the Muramites came and then I was only a hatchling. It is said that he carried a scepter granted by Dranik himself. This scepter will glow as long as its owner is alive. If you can recover his scepter along with three tattered chimera pelts to conceal it in, I will be able confirm if he is still alive. I can reward you with an ornate leather chest plate that I made under the tutelage of Master Lenarsk.");
		elseif(e.message:findi("leg")) then
		  e.self:Say("As you may know, Kuua was not the first world touched by Discord. I have heard many stories of past conquest told by the Muramites. They say that the last ember of a Discord-ravaged city will burn for many years, long after the ruins of the city itself have been covered over by time. Some say it's the city's spirit, slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three dragorn-crafted metal bowls to contain it, I can keep this precious item away from the Muramites. I do not think the last remnants of a destroyed world should be flaunted with such irreverence. Secure these from the Muramites and my leather leggings shall be yours.");
		elseif(e.message:findi("feet")) then
		  e.self:Say("When Discord first descended upon Kuua, many of my own kin turned traitor. There is talk of a traitors' stone which is etched with the names of all dragorn who conspired with the Muramites in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitor stones, now found on some of my twisted brethen, along with two Muramite Dragorn slaver whips, I can bury these items for good. If the dragorn are going to make a united stand against the Muramites, we need to forget about the treacheries of the past and stand together as one united force. Burying this stone will bring us together as a people. Bring me these items and I can reward you with a finely crafted pair of leather boots. Good luck!");
    		end
	else
		e.self:Emote("hisses at you.");

	end
end


function event_trade(e)
	local class = e.other:Class();
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 2 or e.other:GetGM() and (class == "Monk" or class == "Beastlord" or class == "Druid" or e.other:GetGM())) then -- require warmly and leather
		
		if(item_lib.check_turn_in(e.trade, {item1 = 51446,item2 = 51467,item3 = 51467})) then -- leather hand rewards
			e.self:Say("Well done, ".. e.other:GetCleanName() ..".  I did not think it possible!  Hopefully stealing this item will slow the Muramites and buy those rebels time to plan their next attack.  Please accept this set of leather gloves as a token of my thanks!'");
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70786,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70842,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70779,100000); -- Item: 
				end


		elseif(item_lib.check_turn_in(e.trade, {item1 = 51445,item2 = 51466,item3 = 51466})) then -- leather wrist rewards 
			e.self:Say("The Blood Standard of Dranik! I did not believe it still existed! This will bring hope to the few dragorn who still resist Mata Muram. I only wish I was ready to join them. Thank you. As promised, here is a leather wristguard as a reward.");
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70785,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70841,100000); -- Item:
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70778,100000); -- Item:
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51444,item2 = 51465,item3 = 51465})) then -- leather arms rewards
			e.self:Say("'Thank you, ".. e.other:GetCleanName() ..".  With these items I should be able to at least envision the beauty of Kuua before the Muramites came.  In return for your efforts, here are the leather armguards I promised.'");
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70784,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70840,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70777,100000); -- Item: 
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51440,item2 = 51461,item3 = 51461})) then -- leather head rewards
			e.self:Say("'The Duskfall Chronicles!  They still exist!  I feared that the knowledge contained in this book was lost forever.  At least now the lives of those of who came before me shall not be lost in vain.  I just hope some usable knowledge can be extracted from this tome.  Here, take this leather helm as your reward.  May it serve you well on your travels.'");
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70783,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70839,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70776,100000); -- Item: 
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51441,item2 = 51462,item3 = 51462,item4 = 51462})) then -- leather chest rewards 
			e.self:Say("'Yes, this is it the scepter of my Yumall!  I recognize the markings!  Alas, the glow has left the scepter which means Yumall no longer draws breath.  At least now, we can morn his passing.  Before we were never sure.  As promised, here is my finest work, an ornate leather chest piece.  May it serve you well on your stand against the Muramites!'");
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70788,100000); -- Item:
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70844,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70781,100000); -- Item: 
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51442,item2 = 51463,item3 = 51463,item4 = 51463})) then -- leather leg rewards
			e.self:Say("'So it's true, the embers do exist!  I'm glad this was removed from the hands of the Muramites.  I only hope Dranik is not one day reduced to one of these embers.  As promised, here are the leggings crafted by Master Lenarsk as your reward.'");
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70789,100000); -- Item: 
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70845,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70782,100000); -- Item: 
				end
		elseif(item_lib.check_turn_in(e.trade, {item1 = 51443,item2 = 51464,item3 = 51464})) then -- leather feet rewards 
			e.self:Say("Well done ".. e.other:GetCleanName() ..". I understand the Muramites guard these well. I'll bury this stone so the dragorn of Kuua can move on from the horrors of the past and instead look to the future. As promised, here is a pair of finely crafted leather boots as your reward.");
				if class == "Monk" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70787,100000); -- Item:
				end
				if class == "Beastlord" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70843,100000); -- Item: 
				end
				if class == "Druid" or e.other:GetGM() then
					e.other:QuestReward(e.self,0,0,0,0,70780,100000); -- Item: 
				end
		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
