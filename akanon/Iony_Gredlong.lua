function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18775) == true) then
		e.other:Message(15,"Iony Gredlong's tiny voice echoes throughout the room. 'Welcome to the Abbey of Deep Musing " .. e.other:GetName() .. ". I am Iony Gredlong, your new Guild Master should you accept the ways of the Clerics of the Deep Muses. Read the note in your inventory and then hand it to me when you are ready to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is very nice to meet you " .. e.other:GetName() .. ". I am Iony Gredlong Priestess of the Underfoot. I coordinate all the training for new clerics here in the Deep Musing. If you are a [cleric] then I might just have some tests for you that will challenge your wisdom as well as your fighting abilities.");
	elseif(e.message:findi("cleric")) then
		e.self:Say("Well you would certainly be eligible for my training then young " .. e.other:GetName() .. ". I have a number of armor recipes that I give to young clerics to make sure that when they leave the comfort of the Steamfont Mountains they are ready for whatever battles they may face. If you are [interested in creating your own armor] then all you must do is simply ask and I will give you instructions to get started.");
	elseif(e.message:findi("interested in creating")) then
		e.self:Say("I am always happy to see an eager young one like yourself! Brell certainly takes pride in all young gnomes that draw power from him to give life so you should consider yourself very special. To create your own armor you are going to collect [various items] from Ak`Anon and Steamfont. You will then combine them in this assembly kit. Once you have made a material you will place it in a forge along with molds that I will present to you to create your armor.");
		e.other:SummonItem(17253);
	elseif(e.message:findi("various items")) then
		e.self:Say("There are numerous items that you will need to collect and combine in your kit. I will present you for the recipe for Shortnoble Platemail [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. When you are ready to attempt a specific piece please let me know what piece you want to [craft] and I will give you the necessary mold along with the recipe.");
	elseif(e.message:findi("helm")) then
		e.self:Say("Getting something on top of your head is a wise idea " .. e.other:GetName() .. ". To create your helm material you will need to combine 2 Bricks of Crude Bronze, 1 Rat Whisker, 1 Spiderling Silk and 1 Water Flask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Helm");
		e.other:SummonItem(22610);
	elseif(e.message:findi("bracer")) then
		e.self:Say("Bracers are very important to keep your wrists safe in battle " .. e.other:GetName() .. ". To create your bracer material you will need to combine 1 Brick of Crude Bronze, 1 Size 4 Gizmo, 1 Clockwork Spider Mesh and 1 Cloth Choker in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Bracer.");
		e.other:SummonItem(22611);
	elseif(e.message:findi("boots")) then
		e.self:Say("Well you cant go running around the Steamfont Mountains with no shoes on now can you. To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Kobold Tooth, 2 Spiderling Silks and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Boots.");
		e.other:SummonItem(22612);
	elseif(e.message:findi("armguards")) then
		e.self:Say("In order to keep those big muscles that all gnomes like us are blessed with you will definitely need some Armguards! To create your armguard material you will need to combine 2 Bricks of Crude Bronze, 2 Harpy Wings and 1 Snake Fang in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Armguards.");
		e.other:SummonItem(22613);
	elseif(e.message:findi("greaves")) then
		e.self:Say("Pants are most definitely an essential armor piece for any young cleric in training. To create your greaves material you will need to combine 4 Bricks of Crude Bronze, 1 High Quality Cat Pelt, 1 Minotaur Scalp, 1 Bottle and the Torn Cloak of Faerron in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Greaves.");
		e.other:SummonItem(22614);
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("Keeping your hands well protected is very important while you are in training. To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 1 Brownie Brain and 2 Mountain Lion Claws in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Gauntlets.");
		e.other:SummonItem(22615);
	elseif(e.message:findi("breastplate")) then
		e.self:Say("I believe you are ready to craft and gather the components for the most difficult piece of Shortnoble Platemail. To create your breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Clockwork Spider Thorax Plate, 1 Brownie Parts, 1 Aviak Talon 1 Scrap Metal and the evil Halorniop`s Insignia in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Breastplate. Return to me for one [final favor] I have to ask of you after you have completed your breastplate.");
		e.other:SummonItem(22616);
	elseif(e.message:findi("final favor")) then
		e.self:Say("I thank you for returning to me young Gearsword. I must say that it is now quite clear that you are very capable of completing any task I should assign you due to your eagerness to learn. I am currently in need of a few specific items to craft a weapon worthy of any servant of Brell. It is my hope that I can pass these out to our new recruits quite soon. Will you [collect the items I require]?");
	elseif(e.message:findi("collect the items")) then
		e.self:Say("I need 3 Flawless Harpy Claws and 1 Ebon Drake Backbone still to have all the items necessary to craft this new mace. Once I have these items I can make a Shortnobles Walking Staff. For your trouble I will offer you my first staff made should I be able to create one. I hope to see you soon!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9105,item2 = 9105,item3 = 9105,item4 = 9106})) then
		e.self:Say("Thank you! Here, take this staff and good luck on your journey."); -- Text made up
		e.other:SummonItem(9107); 	-- Walking Staff of the Shortnoble
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18775})) then
		e.self:Say("Welcome to the Abbey of Deep Musing.  Here you can train and raise your abilities to the peak of perfection. Take this tunic and wear it with pride. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various trades you will have available to you. In addition, if you'd like to make your own set of equipment, please talk to Maldeny Gredlong. You can find her by the shops down by the water.");
		e.other:SummonItem(13517);  -- worn felt tunic
		e.other:Ding();
		e.other:Faction(76,100,0); 	-- Deep Muses
		e.other:Faction(210,15,0); 	-- Merchants of Ak'Anon
		e.other:Faction(115,15,0); 	-- Gem Choppers
		e.other:Faction(71,-15,0); 	-- Dark Reflection
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
