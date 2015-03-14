function event_say(e) 
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Zonkers! You scared me! Well it is good to meet you nonetheless young %s. Many young Guardians of the Vale often come to me for guidance. If there is something I can help you with in your training you make sure you let Dalorio know! In the meanwhile I will be working on my [trade].", e.other:GetCleanName()));
	elseif(e.message:findi("trade")) then
		e.self:Say(string.format("Well you see %s, I have been an aspiring blacksmith for quite sometime now. I have spent mostly all of my spare time since I was just a wee whipper snapper like yourself collecting different materials and trying to craft anything and everything of value in our town forge. Blacksmithing has always interested me and that interest is exactly what led to the creation of my [special recipes].", e.other:GetCleanName()));
	elseif(e.message:findi("special recipes")) then
		e.self:Say(string.format("Well its funny that you ask %s. I have just recently perfected my smithing recipes for Proudfoot Platemail. I would be willing to part with my recipe along with a mold for each piece of this fine platemail to any apprentice willing to [collect the necessary items] to craft it.", e.other:GetCleanName()));
	elseif(e.message:findi("collect the necessary items")) then
		e.self:Say(string.format("You will eh %s? I am happy to hear of an upcoming Warrior of the Vale willing to collect the items necessary to craft their own armor. I must admit that you could really use some armor because it can get quite dangerous out in the thicket! Now back to business! To craft your own Proudfoot Platemail you will need my magical assembly kit that you will combine the items I ask you to gather for specific recipes. After you have done this you will use the pattern I give you along with the material you have fashioned and combine it in a forge to yield your armor piece. Now are you [ready to get started]?", e.other:GetCleanName()));
	elseif(e.message:findi("ready to get started")) then
		e.self:Say(string.format("Very well %s, let's get to it! Here is my personal Platemail assembly kit. Inside this magical assembly kit you will combine certain items collected both from the thicket and our great city of Rivervale. It is my hope that while you progress in your training and through the different armor pieces that you will be able to learn of your surroundings both inside and outside the Vale. If you are ready to start fashioning your items simply tell me what armor piece you [want] to make. I have the recipe for Proudfoot Platemail [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. As a side note, make sure you craft your Breastplate last due to the difficulty of collecting the items for it.", e.other:GetCleanName()));
		e.other:SummonItem(17248); --Dalorio's Assembly Kit
	elseif(e.message:findi("I want to make a helm")) then
		e.self:Say(string.format("Ok %s, for your helm material you will need to collect 2 Bricks of Crude Iron Ore, 1 Large Yellowjacket Tarsus, 1 Ruined Wolf Pelt and 1 Jumjum Juice then combine them in your assembly kit. Once you have crafted your Proudfoot Helm Material combine it with this mold in the forge to create your Proudfoot Platemail Helm.", e.other:GetCleanName()));
		e.other:SummonItem(22610);
	elseif(e.message:findi("I want to make a bracer")) then
		e.self:Say(string.format("Alrighty then %s! To create your bracer material you will need to gather 2 Bricks of Crude Iron Ore, 1 Thorn Drakeling Scale, 2 Fire Beetle Eyes and 1 Lettuce then combine them in your assembly kit. After creating your Proudfoot Bracer Material combine it in a forge with this mold to fashion your Proudfoot Platemail Bracer.", e.other:GetCleanName()));
		e.other:SummonItem(22611);
	elseif(e.message:findi("I want to make armguards")) then
		e.self:Say(string.format("Been taking a few too many blows on the arms there %s? Well I can certainly understand any Halflings need for some armguards. Round up 3 Bricks of Crude Iron Ore, 2 Rat Whiskers, 2 Mossy Rat Pelts and 1 Wolf Meat then combine them in your kit. Once you have made the Proudfoot Armguards Material take it to a forge and combine it together with this mold to fashion your Proudfoot Platemail Armguards.", e.other:GetCleanName()));
		e.other:SummonItem(22613);
	elseif(e.message:findi("I want to make boots")) then
		e.self:Say("Fantastic! To create the Proudfoot Boot Material necessary for crafting your Proudfoot Platemail Boots you will need to collect 2 Bricks of Crude Iron Ore, 2 Bat Wings, 2 Water Flasks and 1 Large Wood Spider Tibia. After you have your Proudfoot Boot Material combine it in the forge with this mold to create your Proudfoot Platemail Boots.");
		e.other:SummonItem(22612);
	elseif(e.message:findi("I want to make greaves")) then
		e.self:Say("I would have to agree that some Greaves are the most important armor piece in any Halfling Warriors arsenal. If you wish to make the material necessary for these Greaves then gather 4 Bricks of Crude Iron Ore, 2 Ruined Mossy Rat Pelts, 2 Thick Grizzly Bear Skins and 1 Bixie Parts then combine them in your kit. After you have your Proudfoot Greaves Material combine it in the forge with this mold to create your Proudfoot Platemail Greaves.");
		e.other:SummonItem(22614);
	elseif(e.message:findi("I want to make gauntlets")) then
		e.self:Say("If you wish to gather the items necessary for your gauntlet pattern you will need to collect 3 Bricks of Crude Iron Ore, 1 Thorn Drakeling Scale, 1 Large Fruit Bat Fur, 1 Rat Tooth and 1 Spider Silk then combine them in your kit. Once you have done this take your Proudfoot Gauntlets Material to the nearest forge along with this mold to fashion together your Proudfoot Platemail Gauntlets.");
		e.other:SummonItem(22615);
	elseif(e.message:findi("I want to make a breastplate")) then
		e.self:Say("So you feel the time has come and that you have the skills necessary to collect and fashion together all the items necessary for the Proudfoot Breastplate Material? Well I don't think you would ask if you were not ready, so please collect 5 Bricks of Crude Iron Ore, 1 Giant Fruit Bat Wing, 1 Giant Fruit Bat Rib Cage, 1 Giant Yellowjacket Thorax, 1 Large Yellowjacket Tarsus and 1 Deathfist Slashed Belt then combine them in your kit. Once you are finished, take this mold along with your material to a forge to create your Proudfoot Platemail Breastplate. Also return to me after you are finished with your Breastplate for I might have some [small assignments] for you.");
		e.other:SummonItem(22616);
	elseif(e.message:findi("small assignments")) then
		e.self:Say(string.format("Well you see we have been invaded by the Runnyeye goblins many times before %s. However lately there have been more and more attacks on our homeland with every attack being that much more brutal and savage then the attack before. I need a brave halfling who is willing to [seek retribution] on these goblins and show them who is boss once and for all.", e.other:GetCleanName()));
	elseif(e.message:findi("seek retribution")) then
		e.self:Say(string.format("I knew I could count on you young %s. As each day goes by more and more bloodthirsty orcs set up camp in the thicket. They are working together with the goblins of Runnyeye through some twisted alliance brought forth by Lord Pickclaw to mount an attack on Rivervale. I strongly feel that this attack may be more then we can handle. If we are able to find out how they plan to attack us we can make sure that their plan will not be carried out. Once you have obtained 4 pages of war documents from these monsters return them to me and I will reward you greatly for your efforts.", e.other:GetCleanName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 22940, item2 = 22941, item3 = 22942, item4 = 22943})) then
  		e.self:Say(string.format("Great! Now we can stop this meager attempt at an attack! Here %s, I knew you would come through for us!", e.other:GetCleanName()));
		e.other:AddEXP(500);
  		e.other:SummonItem(22945);
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end
--END of FILE Zone:rivervale  ID:19025 -- Dalorio_Blistbobble