function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you " .. e.other:GetName() .. ". I am Filian Weagleross High Priest of the glorious Rodcet Nife! I have recently taken upon some very [important duties] here in our temple so if your business is not urgent please excuse me.");
	elseif(e.message:findi("important duties")) then
		e.self:Say("My important duties are training the new recruits of our temple. It can be quite perilious for a new adventurer in our world today as I am sure you will soon find out. The Temple of Life is dedicated to ensuring that once our young ones leave our home to venture out into Norrath they are ready for whatever might present itself. If you are a [young cleric of Rodcet] then we can begin your training at once.");
	elseif(e.message:findi("young cleric of rodcet")) then
		e.self:Say("Your training will be very important to your development as a Cleric of Rodcet Nife so I do hope you will remain focused at all times. Your exercises will take you all over your hunting area and our city to specific [magical items].");
	elseif(e.message:findi("magical item")) then
		e.self:Say("The magical items you need to collect will be necessary for creating your magical armor will be placed in this Prime Healers Mail Kit that will create armor materials.When you are ready to collect the items necessary for creating a piece of armor all you must do is tell me what armor piece you [want] to craft. I can present you with the recipes and armor molds for Prime Healer Initiate [Helms]. [Bracers]. [Armguards]. [Boots]. [Greaves]. [Gauntlets] and [Breastplates].");
		e.other:SummonItem(17267);
	elseif(e.message:findi("helm")) then
		e.self:Say("To create your helm material you will need to combine 2 Bricks of Crude of Iron Ore. 1 Piece of Rat Fur and 1 Chunk of Meat in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Prime Healer Initiate.");
		e.other:SummonItem(22610);
	elseif(e.message:findi("bracer")) then
		e.self:Say("To create your bracer material you will need to combine 1 Brick of Crude of Iron Ore. 1 Brown Bear Femur and 1 Giant Rat Ear in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Prime Healer Initiate.");
		e.other:SummonItem(22611);
	elseif(e.message:findi("armguard")) then
		e.self:Say("To create your armguards material you will need to combine 2 Bricks of Crude of Iron Ore. 2 King Snake Scales. 1 Rat Whiskers and 1 Large Myotis Bat Ear in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Prime Healer Initiate.");
		e.other:SummonItem(22613);
	elseif(e.message:findi("boot")) then
		e.self:Say("To create your boot material you will need to combine 3 Bricks of Crude of Iron Ore. 1 Severed Gnoll Foot. 2 Rabid Wolf Hides. 1 Large Myotis Bat Wing in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boot of the Prime Healer Initiate.");
		e.other:SummonItem(22612);
	elseif(e.message:findi("greave")) then
		e.self:Say("To create your greaves material you will need to combine 4 Bricks of Crude of Iron Ore. 1 Bear Meat. 1 Giant Fire Beetle Leg and 1 Young Plains Scalp in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Prime Healer Initiate.");
		e.other:SummonItem(22614);
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To create your gauntlet material you will need to combine 3 Bricks of Crude of Iron Ore. 1 Spider Legs. 1 Lion Tooth. 1 Wolf Meat and 1 Bandit Sash in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Prime Healer Initiate .");
		e.other:SummonItem(22615);  
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To create your breastplate material you will need to combine 5 Bricks of Crude of Iron Ore. 1 High Quality Cat Pelt. 1 Golden Bandit Tooth. 1 Shadow Wolf Paw. 1 Matted Lion Pelt and 1 Lock of Scarecrow Straw in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Prime Healer Initiate. When you have completed your armor I have a [delivery] for you to make.");
		e.other:SummonItem(22616);
	elseif(e.message:findi("what delivery")) then
		e.self:Say("As we speak I have a recruit much like yourself scouting in Blackburrow to monitor the Gnolls that reside there. They have been stockpiling supplies and many fear it is for an upcoming attack. Please deliver this bag of rations to him and return to me with his report along with 1 Perfect Gnoll Skin and 2 Severed Gnoll Paws and you shall be rewarded for your efforts.");
		e.other:SummonItem(27498);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:qeynos2  ID:2032 -- Filian_Weagleross 
