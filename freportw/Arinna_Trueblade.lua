function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, "..e.other:GetName()..". I am Arianna Trueblade, Warlord of the Steel Warriors. I am personally in charge of all the training that our young warriors receive. I take pride in knowing that my teaching can help make the foundation of a Freeport Champion. If you are a [warrior] then we might just have something to talk about.");
	elseif(e.other:Class() == "Warrior") then
		if(e.message:findi("warrior")) then
			e.self:Say("So you think you have what it takes to become one of Freeports finest? I will warn you now that we expect every single warrior that is brought into our ranks to go through a series of exercises. Rest assured you will be rewarded for your hard work with a set of armor that I will walk you though the process of making. Are you [ready to begin your testing]?");
		elseif(e.message:findi("ready to begin")) then
			e.self:Say("Very well, "..e.other:GetName()..". Here is your Steel Warriors Mail Kit. This kit will be your main tool in creating your own armor. You will gather various items from all areas of Freeport from monsters and stores alike. You will use specific item combinations in this kit to fashion together armor materials that you will combine in a forge with the appropriate mold to make an armor piece. Once you are ready to attempt a piece of armor simply tell me what piece you want to craft. I will then present you with the recipe and mold for Steel Warrior [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
			e.other:SummonItem(17262); -- Steel Warriors Mail Kit
		elseif(e.message:findi("helm")) then
			e.self:Say("Any Steel Warrior that is caught not wearing a helm is usually placed on probation. We feel it is necessary sometimes to do this so that our younger ones in training will understand the importance of keeping your head well protected. To create your helm material you will need to combine two Bricks of Crude Iron Ore, one Rat Ear, one Meat Pie and one Barley in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Helm.");
			e.other:SummonItem(22610); -- An Enchanted Helm Mold
		elseif(e.message:findi("bracer")) then
			e.self:Say("As you progress further through your training you will find yourself in heavy battle more and more often. Bracers will ensure that you are able to fend off your opponents blows with minimum injury. To create your bracer material you will need to combine one Brick of Crude Iron Ore, one Rotting Zombie Skull, one Snake Bile and one Tiny Dagger in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Bracer.");
			e.other:SummonItem(22611); -- An Enchanted Bracer Mold
		elseif(e.message:findi("armguards")) then
			e.self:Say("A slash or gash to the arms can greatly hinder a warrior's combat abilities. Wearing these armguards will ensure that this does not happen. To create your armguard material you will need to combine two Bricks of Crude Iron Ore, two Young Kodiak Paws, one Young Plains Cat Scalp and one Freeport Stout in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Steel Warriors Armguards.");
			e.other:SummonItem(22613); -- An Enchanted Armguard
		elseif(e.message:findi("boots")) then
			e.self:Say("Boots are very necessary for any warrior especially when you will usually be the one leading most combat units. Being on the front line and treading across terrains first make good boots a must. To create your boots material you will need to combine three Bricks of Crude Iron Ore, one Shadow Wolf Tibia and two Spiderling Eyes in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Boots.");
			e.other:SummonItem(22612); -- An Enchanted Boot Mold
		elseif(e.message:findi("greaves")) then
			e.self:Say("While most armor pieces are very vital to a young warriors survival, greaves are one of the most important armor pieces you will craft. To create your greaves material you will need to combine four Bricks of Crude Iron Ore, one Giant Fire Beetle Brain, one Lion Tail, one Bottle and one Young Puma Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Greaves.");
			e.other:SummonItem(22614); -- An Enchanted Greaves Mold
		elseif(e.message:findi("gauntlets")) then
			e.self:Say("Keeping your hands well guarded is without question the most important thing a warrior will do. Suffering a blow to the hands that would prevent you from defending yourself would most certainly mean death. To create your gauntlet material you will need to combine three Bricks of Crude Iron Ore, one Armadillo Tail, one Severed Orc Foot, and two Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Gauntlets.");
			e.other:SummonItem(22615);
		elseif(e.message:findi("breastplate")) then
			e.self:Say("Your dedication to learning everything about your class is impressive, "..e.other:GetName()..". I have no doubt that you are ready to collect the pieces for your Steel Warriors Breastplate. To create your breastplate material you will need to combine five Bricks of Crude Iron Ore, one Deathfist Orc Skull, one Woven Spider Silk, one Armadillo Carapace, one Matted Lion Pelt and one Rusty Short Sword in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Breastplate. Please come back to see me after you are finished with your breastplate for your [final task].");
			e.other:SummonItem(22616); -- An Enchanted Breastplate Mold
		elseif(e.message:findi("final task")) then
			e.self:Say("I am in need of some assistance to craft a special sword that I would like to present all graduates of my training like yourself with. However. I don't have all the pieces I need to make one. If you could retrieve a Pristine Giant Scarab Leg, one Lion Paw and one Vial of Smoke I will have all I need to create this weapon. I would have no problem presenting you with the first if I was able to create it. See you soon.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:Class() == "Warrior") then
		if(item_lib.check_turn_in(e.trade, {item1 = 9919,item2 = 9918,item3 = 9923})) then -- Pristine Giant Scarab Leg, Lion Paw, Vial of Smoke
			e.self:Say(""..e.other:GetName()..", you have proven your value to the Steel Warriors. Here is a weapon that will let you slay magical creatures that you couldn't with a normal weapon.");
			e.other:Ding();
			e.other:SummonItem(9940); -- Jagged Blade of the Steel Warrior
			e.other:AddEXP(100);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--  EOF Arinna_Trueblade