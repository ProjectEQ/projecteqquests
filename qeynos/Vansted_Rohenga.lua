function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say(string.format("Pleased to meet you %s. I am Vansted Rohenga High Priest of Karana. I have spent all of my years studying the ways of the Cleric in our wonderful Temple of Thunder. We receive many new recruits every day and it is my duty to place them in my [training program].",e.other:GetName()));
	elseif(e.message:findi("training program")) then
		e.self:Say("Well all young clerics of Karana are brought up from their first day of training to know and respect their practice. I have developed a number of exercises that will enable a young cleric to make a set of their own armor by means of collecting certain items and making [enchanted armor materials] out of them.");
	elseif(e.message:findi("enchanted armor materials")) then
		e.self:Say("Recently we have discovered that combing certain items in certain quantities using a magical assembly kit can forge together an armor material. These armor materials are used with specific armor molds to create a piece of enchanted Stormhealer Armor. If you would like to [begin forging armor materials] I will present you with your Stormhealers Assembly Kit.");
	elseif(e.message:findi("begin forging armor materials")) then
		e.self:Say(string.format("Excellent %s, please take this Stormhealers Assembly Kit. It is in this kit that you will combine certain items together into materials necessary for crafting your armor. I can present you with the material recipes and armor molds for Stormhealer [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. When you are ready to gather the items for an armor piece simply tell me what piece you [want] to craft. Once you have created a specific material take it to a forge along with the applicable mold to create your armor piece.",e.other:GetName()));
		e.other:SummonItem(17265);
	elseif(e.message:findi("helms")) then
		e.self:Say("Here is your Stormhealers Helm Mold. To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Field Rat Ribcage, 1 Rat Tooth and 1 Honey Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Stormhealer.");
		e.other:SummonItem(22610);
	elseif(e.message:findi("bracers")) then
		e.self:Say("Here is your Stormhealers Bracer Mold. To create your bracer material you will need to combine 1 Brick of Crude Iron, 1 Field Rat Skull, 1 Coyote Skull and 1 Grapes in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Stormhealer.");
		e.other:SummonItem(22611);
	elseif(e.message:findi("armguard")) then
		e.self:Say("Here is your Stormhealers Armguard Mold. To create your armguards material you will need to combine 2 Bricks of Crude Iron, 2 Whiskered Bat Fangs, and 1 Torch in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Stormhealer.");
		e.other:SummonItem(22613);
	elseif(e.message:findi("boot")) then
		e.self:Say("Here is your Stormhealers Boot Mold. To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Ruined Blackburrow Gnoll Pelt, 2 Gnoll Fangs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boot of the Stormhealer.");
		e.other:SummonItem(22612);
	elseif(e.message:findi("greave")) then
		e.self:Say("Here is your Stormhealers Greaves Mold. To create your greaves material you will need to combine 5 Bricks of Crude Iron, 1 Giant Fire Beetle Brain, 1 Shadow Wolf Paw, 1 Bottle and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Stormhealer.");
		e.other:SummonItem(22614);
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("Here is your Stormhealers Gauntlet Mold. To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Puma Skin, 1 Bear Meat, and 1 Bandit Sash in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Stormhealer.");
		e.other:SummonItem(22615);
	elseif(e.message:findi("breastplate")) then
		e.self:Say("Here is your Stormhealers Breastplate Mold. To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Young Plains Cat Scalp, 1 Low Quality Bear Skin, 1 Water Flask 1 Lock of Scarecrow Straw and 1 Giant Fire Beetle Carapace in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Stormhealer. Please come back to see me after you have completed your breastplate. I have a [final favor] to ask of you.");
		e.other:SummonItem(22616);
	elseif(e.message:findi("favor")) then
		e.self:Say("I thank you for returning to assist me in this very important task. It has come to my attention that the gnolls of Blackburrow are planning an attack on Qeynos sometime in the near future. Although I know that these hairballs posses no actual fighting skills, they can present a problem for the defenders of our city just due to sheer numbers. I need you to infiltrate Blackburrow and retrieve some [important documents] for me.");
	elseif(e.message:findi("important document")) then
		e.self:Say("There is a believed to be a gnoll tactician somewhere in the gnoll camp of Blackburrow. I need you to bring whatever battle plans he may be in possession of so that I can position my troops accordingly. Return to me with whatever battle plans you can find along with 2 Gnoll Backbones and I will surely reward you for your dedication.");
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 27416,item2 = 27405,item3 = 27405})) then
		e.self:Say(string.format("Congratulations, %s!  Your dedication and hard work will allow me to position my troops accordingly.  Take this mace as a reward!",e.other:GetName())); -- ad lib text
		e.other:SummonItem(27489);
		e.other:Ding();
		e.other:Faction(257,10,0);
		e.other:Faction(183,10,0);
		e.other:Faction(21,-10,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(1000);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end
