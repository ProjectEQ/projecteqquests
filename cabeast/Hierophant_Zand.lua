--Heirophant Zand starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it. She is also for the 3rd and 5th shaman skullcap quests.
-- items: 18271, 18272, 24770, 12734, 12741, 5144, 12740

function event_say(e)
	if((e.message:findi("chosen savior")) and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Say("I am honored to meet the one who shall pledge his life to the return of the Skulls of the Ancients. However, I must see proof of our prowess as of yet. Go to the outlands and retrieve one Froglok Hexdoll, and no, they are not found on Frogloks. They are shaman dolls made by the goblin tribe.");
	elseif(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Terror, young one. May the pain of the ancients guide you. Have you lost your Iron Cudgel of the Petitioner?"); --Could not find original text
	elseif(e.message:findi("no")) then
		e.self:Say("The Temple of Terror requires all young Scaled Mystics to wear the symbol of their station. Wear it with pride in these halls to display the rank you have attained. Go now, and serve The Faceless."); --Could not find original text
	elseif(e.message:findi("yes")) then 		--The Penance quest
		e.self:Emote("shakes his head and growls. 'That is not good, broodling... Not good at all. You will need to take this note and seek out the Toilmaster immediately. Read it on the way and hope that your incompetence can be overcome. The Crusaders of Greenmist have a pit meant for you, should this prove to be impossible."); --Could not find original text
		e.other:SummonItem(18271); 				--A Ragged Book
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18272, item2 = 24770})) then --The Penance quest
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time. 'Lucky you. You have earned a second chance. Praise Cazic-Thule!'");
		e.other:QuestReward(e.self,0,0,0,0,5140); 				--Iron Cudgel of the Petitioner
	end
	--Shaman Skull Quest No.3.1 turn in - Check for  A froglok hex doll
	if(e.other:GetFaction(e.self) <= 4) then
		if(item_lib.check_turn_in(e.trade, {item1 = 12734})) then
			e.self:Say("You have proven your prowess to me, now take this note to Crusader Quarg outside the city and he will test you further.");
			e.other:Faction(445, 10); 				--Scaled Mystics
			e.other:Faction(441, 10); 				--Legion of Cabilis
			e.other:QuestReward(e.self,0,0,0,5,18054,80000); 	--A note to take to crusader Quarg.
		--Shaman Skull Quest No.5 turn in - Iksar Skull Helm and Iksar Skull and Cudgel of the Prophet
		elseif(item_lib.check_turn_in(e.trade, {item1 = 12741, item2 = 5144, item3 = 12740})) then
			e.self:Say("You have done well in proving yourself to this council, but we have yet more tests for you before you will be a true clairvoyant. Speak with Hierophant Dexl for your next test.");
			e.other:Faction(445, 10); 				--Scaled Mystics
			e.other:Faction(441, 10); 				--Legion of Cabilis
			e.other:QuestReward(e.self,0,0,0,10,5145,120000); 	--Give the player The Cudgel of the Channeler
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
