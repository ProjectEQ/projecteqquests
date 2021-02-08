--Hierophant Oxyn is for the Greenmist quest and is part of the eighth and final quest in the series. He also gives out the Cursed Wafer quest and shaman skullcaps 1 and 2.
-- items: 17020, 3895, 3886, 12403, 12721, 12722, 12723, 5140, 12724, 12725, 5141

function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say("Greetings, and may the pain of the ancients guide you. You have come to us for guidance, have you not? We are the Hierophants of Cabilis and we guide the young Scale Mystics. All petitioners shall speak with me of [temple tasks].");
	elseif((e.message:findi("temple tasks")) and (e.other:GetFaction(e.self) <= 4) and (e.other:Class() == "Shaman")) then
		e.self:Say("The Temple of Terror requires all young Scaled Mystics to [perform daily tasks.]. The tasks are necessary to the upkeep of our order as well as that of our brothers, the Crusaders of Greenmist.");
	elseif((e.message:findi("daily tasks")) and (e.other:GetFaction(e.self) <= 4) and (e.other:Class() == "Shaman")) then
		e.self:Say("We require many components for various rituals. Take this Component mortar and fill it with the following items - foraged [mud crabs]. two small mosquito wings and one portion of bone chips. You must then use the pestle and combine all the components. When you have a full component mortar, you may return to me and I shall pay you your wages, but most importantly, you shall prove your devotion to the Scaled Mystics.");
		e.other:SummonItem(17020); -- Component Mortar
	elseif(e.message:findi("mud crabs")) then 					--Cursed Wafers quest
		e.self:Say("Mud crabs are tiny crustaceans which live along the mudcaked shores of the Lake of Ill Omen. You can forage for them and find a handful of them at a time.");
	--Shaman Skull Quest No.1 Event_Say
	elseif((e.message:findi("lost skulls")) and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Say("You must have heard of the Trilac Brotherhoods disappearance. They are the skulls of three soon to be ancients. They were taken from this temple by a silent intruder. Crusaders are always on duty. I do not know how they got into our vault. Every petitioner is ordered to search for the three skulls and return them to me along with their petitioner cudgel and then they shall become clairvoyants.");
	elseif(e.message:findi("iron cudgel")) then
		if (e.other:GetFaction(e.self) <= 4) then
			e.self:Emote("shakes his head and waves a finger in your face. If you are looking to be handed the Iron Cudgel of the Clairvoyant then you are sadly mistaken. Perhaps if you were to gather a few [lost skulls] for the temple we may find you worthy to wield one.'");
		else
			e.self:Say("If you are looking to be handed the Iron Cudgel of the Clairvoyant then you are sadly mistaken. Perhaps if you were to gather a few [lost skulls] for the temple we may find you worthy to wield one.");
		end
	--Shaman Skull Quest No.2 Event_Say
	elseif((e.message:findi("larger problem")) and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Say("Many of the ancient skulls have been cast out of our temple. A hierophant was supposed to cast a special spell which was to protect the skulls from dust and decay. He cast some unknown spell which has sent many of our skulls to their original point of death. It would be most helpful if you would [assist in collecting the ancient skulls].");
	elseif((e.message:findi("ancient skull")) and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Emote("seems unsure of your prowess. 'Hmmm. First you shall go after the two skulls of the Cleansers of the Outlands. If you find them, bring them back unbroken and then I shall trust you. Hand me both skulls and your iron cudgel of the clairvoyant and I will know you are prepared.'");
	elseif(e.message:findi("liquid")) then 						--Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Say("The bottle contains deklium in a liquid solution. The metal of prophecy has been determined to rest in a mass of living earth. Our scholars have written of a mass of ore that fell from the heavens. This ore was used in the creation of a blade of our father, Rile. We have been filled with visions of this blade. I have seen it in the hands of our Crusaders as they march towards the new age of Greenmist! Seek out the corrupted earth that guards the interlopers. We have an alchemist near there. He will be able to use the deklium to determine which golem contains the metal. Take care to go in force. I sense that there will be a battle.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 3895},0)) then 	--Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Emote("takes the note and begins to howl into the air! 'The visions are true! The new prophecy begins today, Crusader,' the mystic growls with pleasure. He quickly turns and takes a bottle of murky liquid from one of his potion bags and hands it to you. 'Take this and keep it safe. Our visions have told of this day. We have been able to learn of the metal of prophecy. This [liquid] will help us to locate its true resting place!");
		e.other:Faction(442,20); -- Faction: Crusaders of Greenmist
		e.other:Faction(441,10); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,3892,5000); --Bottle of Liquid Deklium
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 3886},0)) then --Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Emote("holds the ore in his hands and begins to chant. His eyes go white as he raises the chunk of ore above his head. He lowers his arms and shakes his head for a moment. His eyes return to their normal state as they focus on you. The shaman hands you the ore and says, 'Seek out the creator of Rile's blade. He is still on this plane. I have felt his torment. Take this note to Librarian Zimor. He learned a great deal from the tome and can instruct you further.'");
		e.other:Faction(442,20); -- Faction: Crusaders of Greenmist
		e.other:Faction(441,10); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,{items = {3893,3886},exp = 5000}); --Note to Librarian 	--Chunk of Tynnonium
	--Cursed Wafers turn in
	elseif(e.other:GetFaction(e.self) < 5 and e.other:Class() == "Shaman" and item_lib.check_turn_in(e.trade, {item1 = 12403},0)) then --Full Component Mortar
		e.self:Say("We appreciate your service. Take a few copper for your deed as well as some of our cursed waters. They will provide you with nourishment. As for future tasks, we are searching for a few [lost skulls] and i am sure you are searching for your [iron cudgel of the clairvoyant] And i also hear that the furscales are in need of some broodlings to do some manual labor. Tell them Oxyn sent you.");
		e.other:Faction(445, 2); 				--Scaled Mystics
		e.other:Faction(441, 1); 				--Legion of Cabilis
		e.other:QuestReward(e.self,{items = {12406,12406},exp = 50}); --Cursed Wafers 2x
	--Shaman Skull Quest No.1 turn in - Check for  Logrin Skull, Morgl Skull, and Waz Skull hand in along with Iron Cudgel of the Petitioner
	elseif(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.trade, {item1 = 12721, item2 = 12722, item3 = 12723, item4 = 5140})) then
		e.self:Say("Excellent! You have proved yourself worthy to wield the iron cudgel of the clairvoyant. As a clairvoyant I feel I can trust you, so I will tell you that the issue of the missing skulls is a [much larger problem] than last stated.");
		e.other:Faction(445, 10); 				--Scaled Mystics
		e.other:Faction(441, 5); 				--Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,1,5141,2000); --Iron Cudgel of the Clairvoyant
	--shaman skull quest no.2 turn in - check for Skull with I and Skull with II turn in and cudgel
	elseif(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.trade, {item1 = 12724, item2 = 12725, item3 = 5141})) then
		e.self:Say("We are in your debt," .. e.other:GetCleanName() .. " . You are truly one who shall collect all the lost ancient skulls. Take your weapon. Go to Hierophant Zand and he shall guide you further. Tell him you are [the chosen saviour].");
		e.other:Faction(445, 10); 				--Scaled Mystics
		e.other:Faction(441, 5); 				--Legion of Cabilis
		e.other:QuestReward(e.self,0,0,5,1,5142,60000); --Iron Cudgel of the Seer
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
