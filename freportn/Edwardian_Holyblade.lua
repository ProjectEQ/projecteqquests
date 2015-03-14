function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and well met " .. e.other:GetName() .. ". I am Edwardian Holyblade, noble paladin of Marr. I have devoted my life and my blade to the glory of Mithaniel Marr. I am also in charge of training all new paladins of Marr to make sure that they have the best training necessary. If you are a paladin of Marr I may have some [training] for you.");
	elseif(e.message:findi("training")) then
		e.self:Say("I have developed a training program for all young and upcoming Paladins of Marr. My tests will enable you to learn some basic hunting, navigating and armor crafting skills. All of these abilities will be very important on your path to enlightenment. If you are [ready to begin my tests] I will explain to you how the tests will work.");
	elseif(e.message:findi("ready to begin your tests")) then
		e.self:Say("Very well " .. e.other:GetName() .. ". I look forward to seeing you progress through your training. Here is your special mail assembly kit. In this kit you will combine a number of components that you will collect from all areas of Freeport, North Ro and the Commonlands. The components that you will gather and combine in this kit will magically create a specific armor material piece. Each of these materials will be combined in a forge with the appropriate mold that I will provide you with. I will explain to you how the [recipes] work when you are ready.");
		e.other:SummonItem(17266); -- Lightbringers Assembly Kit
	elseif(e.message:findi("recipe")) then
		e.self:Say("Once you have crafted your material from the specific recipes I give you, you will need the appropriate mold as I mentioned before. I can present you with the recipe and mold for Truthbringers [Helm], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplate]. When you are ready to being collecting the components for a material recipe simply tell me what piece you [want] to craft.");
	elseif(e.message:findi("helm")) then
		e.self:Say("I would strongly suggest a good helm as you can see by my patch over my eye I was not so careful in my younger days. To create your helm material you will need to combine 2 Bricks of Crude Iron Ore, 1 Young Kodiak Paw, 1 Ruined Cat Pelt and 1 Hops in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Helm.");
		e.other:SummonItem(22610); -- An Enchanted Helm Mold
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("Sooner or later you will take a tough blow to your hands. Being struck there without the right gauntlets could mean a very serious and painful injury. To create your gauntlet material you will need to combine 3 Bricks of Crude Iron Ore, 1 Giant Spider Egg Sack, 1 Ruined Bear Pelt, and 1 Armadillo Tail in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Gauntlets.");
		e.other:SummonItem(22615); -- An Enchanted Gauntlet Mold
	elseif(e.message:findi("greave")) then
		e.self:Say("I can't begin to tell you how important pants are " .. e.other:GetName() .. ". Any injuries to them could disable you from escaping should you need to and would surely perish due to this. To create your greaves material you will need to combine 4 Bricks of Crude Iron Ore, 1 Coyote Pelt, 1 Shadow Wolf Tibia, 1 Bottle and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Greaves.");
		e.other:SummonItem(22614); -- An Enchanted Greaves Mold
	elseif(e.message:findi("armguard")) then
		e.self:Say("A good set of armguards will keep your arms safe from any attacks you may face while in training. It is a common tactic to go for ones arms because with them disabled it becomes impossible to defend yourself. To create your armguards material you will need to combine 2 Bricks of Crude Iron Ore, 2 Black Bear Paws, and 1 Short Beer in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Armguards.");
		e.other:SummonItem(22613); -- An Enchanted Armguard Mold
	elseif(e.message:findi("bracer")) then
		e.self:Say("I have seen many paladins go without the proper wrist protection and the result was never good. To create your bracer material you will need to combine 1 Brick of Crude Iron Ore, 1 Orc Prayer Beads and 1 Red Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Bracer.");
		e.other:SummonItem(22611); -- An Enchanted Bracer Mold
	elseif(e.message:findi("breastplate")) then
		e.self:Say("Any paladins most important armor piece is always their breastplate. Should you succeed in crafting it your Truthbringer Breastplate will guard your upper body from any serious attacks that would otherwise be quite devasting. To create your breastplate material you will need to combine 5 Bricks of Crude Iron Ore, 1 Young Plains Cat Scalp, 1 Young Puma Skin, 1 Water Flask, 1 Deathfist Orc Skull and 1 Giant Fire Beetle Carapace in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Breastplate. After you have completed your breastplate come back to see me for I have one [final test] for you.");
		e.other:SummonItem(22616); -- An Enchanted Breastplate Mold
	elseif(e.message:findi("boot")) then
		e.self:Say("Boots are a wise armor choice because you never know what you will have to walk across and knowing your feet are protected is one less thing to worry about. To create your boot material you will need to combine 3 Bricks of Crude Iron Ore, 1 Lion Mane and 2 Wolf Meats in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Boots.");
		e.other:SummonItem(22612); -- An Enchanted Boots Mold
	elseif(e.message:findi("final test")) then
		e.self:Say("Well for quite sometime the Freeport Militia has become more and more corrupt. They have been known to do any dastardly deed you can imagine which includes harming and sometimes killing followers of Marr. There is a group of Militia Soldiers in the commonlands that have been recently harassing a good friend of mine. His name is Pardor and he is a shopkeeper in the commonlands. As if it wasn’t dangerous enough in the commonlands he know has these Militia soldiers demanding he pay them a tax that does not exist.  Will you travel to the commonlands to kill one of these militia soldiers? I fear for my friend's life.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 9927,item2 = 9928,item3 = 9929,item4 = 9930})) then  -- Fefslans Bracer, Gnoosals Bracer, Walorinags Bracer, Eridals Bracer
		e.self:Say("Excellent work!"); -- Not actual text
		e.other:SummonItem(9936); -- Longsword of Marr
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18737})) then  -- A tattered note
		e.self:Say("Thanks."); -- Real text still needed
		e.other:Ding();
		e.other:SummonItem(13554); -- Faded Purple Tunic
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportn -- Edwardian_Holyblade