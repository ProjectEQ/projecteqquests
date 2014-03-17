function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you " .. e.other:GetName() .. ". I am Sten Harnak Virtuoso of Freeport. I have lived in Freeport and studied the art of songweaving here for all of my days. I am always eager to see new faces here in our concert hall. If you are here for a performance I am afraid it does not start till a bit later but if you are a young bard in training then I might have some [work] for you.");
	elseif(e.message:findi("what work")) then
		e.self:Say("Well I have numerous concerts here that I must prepare for so I always must be sure that I have the best possible support as far as my fellow bards go. I am always seeking new young talent to sing in our concerts. If you are a bard I have made tasks for you to complete to see if you are a worthy songweaver. These tasks will test your determination and battle skills. I would only allow one that has completed all of my [specific tests] to sing in my concert hall.");
	elseif(e.message:findi("what specific test")) then
		e.self:Say("If you are ready to begin your training I will assign you a number of tests. These tests will enable you to outfit yourself with a suit of armor only worn by the most respected musicians of Freeport. First. I will present you with a Songweavers Assembly Kit. In this kit you will combine certain [recipes] that will be magically formed into an armor material. Each one of these materials will need to be combined in a forge with the appropriate mold to make your armor piece.");
		e.other:SummonItem(17257);
	elseif(e.message:findi("what recipe")) then
		e.self:Say("I have the material recipes available for Songweavers Platemail [Helms]. [Bracers]. [Armguards]. [Boots]. [Greaves]. [Gauntlets] and [Breastplates]. When you are ready to craft a specific piece simply tell me what armor piece you [want] to craft. For example if you would wish to craft a helm tell me [I want to craft a helm]. Also please keep in mind that the components necessary for crafting your breastplate material are the most difficult to collect so you might want to collect them last.");
	elseif(e.message:findi("armguard")) then
		e.self:Say("Armguards will keep your arms well protected in battle from any foe you may face. To create your armguard material you will need to combine 2 Bricks of Crude Iron Ore, 1 Preserved Snake Eye, 1 Burned Out Lightstone and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Armguards.");
		e.other:SummonItem(22613);
	elseif(e.message:findi("bracer")) then
		e.self:Say("A bracer is a very vital part of any bards arsenal. To create your bracer material you will need to combine 1 Brick of Crude Iron Ore, 2 Chunks of Meat, 1 Black Wolf Skin and 1 Cats Eye Agate in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Bracer.");
		e.other:SummonItem(22611);
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("Keeping your hands safe from all wounds is a key to being an effective bard. I am sure you will find it extremely difficult to play your instruments if your hands are not in the best shape possible. To create your gauntlet material you will need to combine 3 Bricks of Crude Iron Ore, 1 Fire Beetle Eye, 1 Orc Pawn Pick and 2 Giant Scarab Brains in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Gauntlets.");
		e.other:SummonItem(22615);
	elseif(e.message:findi("boot")) then
		e.self:Say("Boots are a very important armor piece and I am glad to hear you wish to craft them. To create your boot material you will need to combine 3 Bricks of Crude Iron Ore, 1 Ruined Bear Pelt  and 1 Severed Orc Foot in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Boots.");
		e.other:SummonItem(22612);
	elseif(e.message:findi("a helm")) then
		e.self:Say("A very important armor piece indeed " .. e.other:GetName() .. ". one well placed attack to the head by an adversary could leave you in very poor condition. To create your helm material you will need to combine 2 Bricks of Crude Iron Ore, 1 Ruined Wolf Pelt, 1 Deathfist Pawn Scalp and 1 Barley in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Helm.");
		e.other:SummonItem(22610);
	elseif(e.message:findi("greave")) then
		e.self:Say("Greaves would be a very wise armor choice should you be able to gather the components necessary for the material. To create your greaves material you will need to combine 4 Bricks of Crude Iron Ore, 2 Spiderling Eyes, 1 Lion Tail, 1 Bottle and 1 Grizzly Bear Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Greaves.");
		e.other:SummonItem(22614);
	elseif(e.message:findi("breastplate")) then
		e.self:Say("The right breastplate will defend you from most lifethreating attacks that you may endure while in training. With that said I am very happy to see that you are already set to collect your breastplate material componenets. To create your breastplate material you will need to combine 5 Bricks of Crude Iron Ore, 1 Coyote Skull, 1 Snake Bile, 1 Enlarged Fire Beetle Leg, 1 Vial of Smoke and 1 Young Plains Cat Backbone in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Breastplate. Please return to me after you have completed your final armor piece because I have one more [important task] for you.");
		e.other:SummonItem(22616);
	elseif(e.message:findi("important task")) then
		e.self:Say("There has been numerous reports lately of the Orcs in the Commonlands being up to no good. Some actually believe that they are stockpiling wood for some odd reason.  Regardless of their purpose the increased number of orcs in any given area just spells trouble for all the surrounding areas. I need you to go and [collect some warbeads] from some high ranking orcs. Obtaining these warbeads will not be easy I would presume. Will you assist me in this final task?");
	elseif(e.message:findi("collect some warbead")) then
		e.self:Say("I am very pleased to hear that you will be able to help us. The warbeads that I require will be found on specific Orc Chieftans. I am sure they are not alone and are well guarded so make sure you bring companions with you that are well proven on the battlefield. Bring me the warbeads of Chief Fosloas, Diedridan and Kelleru. I look forward to seeing you soon.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 9924,item2 = 9925,item3 = 9926})) then
		e.self:Say("Good work " .. e.other:GetName() .. ".");
		e.other:Ding();
		e.other:SummonItem(9935);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- End of FILE Zone:freportn - Sten_Harnak