function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to ye too " .. e.other:GetCleanName() .. ", what brings ye to Kaladim`s hall of champions? I am Dirjadak Barbrawler and its gud to meet ye. I pride myself on being one of the finest Warlords to have ever served in Brells Army. However, my days nowadays aren't all that exciting. I just spend me time training young ones that are born into the life of a Kaladim Champion. If you are a young [warrior] of Brell I might have some work for you.");
	elseif(e.message:findi("warrior")) then
		e.self:Say("Excellent " .. e.other:GetCleanName() .. ", you must surely have been sent to me to begin yer training then. Aye? If you are [interested] in beginning yer training as a Champion of Kaladim I will be happy to present you with yer instructions for crafting yer own set of Axebringers Platemail Armor.");
	elseif(e.message:findi("interested")) then
		e.self:Say("Dats great to here dere young one. First and foremost you will need dis Dusty Mail Assembly Kit to combine all the various items that you will need to collect from different parts of the Butcherblock Mountains and in our great city of Kaladim. As you collect specific items from yer surroundings, you will use them in certain quantities in this kit to create armor materials that will then be placed in a forge with armor molds to fashion yer armor. Once you are [ready] to begin collecting the supplies for yer materials I will be happy to supply you with the necessary material recipes and molds to craft yer armor.");
		-- Summon: Dusty Mail Assembly Kit
		e.other:SummonItem(17247); -- Item: Dusty Mail Assembly Kit
	elseif(e.message:findi("ready")) then
		e.self:Say("Glad to ere that I am indeed Aye! When you have decided what armor piece you would like to collect please simply tell me what piece it is that you want to craft and I will supply you material recipe and mold necessary for crafting Axebringers Platemail [Helm], [Bracer], [Armguards], [Boots], [Greaves], [Gauntlets], and [Breastplate].");
	elseif(e.message:findi("armguards")) then
		e.self:Say("To create yer armguards material you will need to combine 2 Bricks of Crude Bronze, 2 Giant Scarab Claw, and 1 Torch in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Armguards of the Axebringer.");
		-- Summon: Crude Vambraces Mold
		e.other:SummonItem(19635); -- Item: Crude Vambrace Mold
	elseif(e.message:findi("boots")) then
		e.self:Say("To create yer boots material you will need to combine 3 Bricks of Crude Bronze, 1 Skunk Eye and 1 Water Flask in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Boots of the Axebringer.");
		-- Summon: Crude Boots Mold
		e.other:SummonItem(19634); -- Item: Crude Boot Mold
	elseif(e.message:findi("bracer")) then
		e.self:Say("To create yer bracer material you will need to combine 1 Bricks of Crude Bronze, 1 Scarab Carapace, 1 Giant Bat Fur and 1 White Wine in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Bracer of the Axebringer.");
		-- Summon: Crude Bracer Mold
		e.other:SummonItem(19632); -- Item: Crude Bracer Mold
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To create yer breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Glyndas Tongue, 1 Pristine Forest Drakeling Scale, 1 Golden Bandit Tooth, 1 Goblin Brain and 1 Aqua Goblin Headdress in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Breastplate of the Axebringer. I would also like to see you after you have completed yer breastplate because I have a final [favor] to ask of ye.");
		-- Summon: Crude Breastplate Mold
		e.other:SummonItem(19637); -- Item: Crude Breastplate Mold
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("To create yer gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Chunk of Meat, 1 Giant Scarab Eye, and 1 Cracked Giant Scarab Carapace in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Gauntlets of the Axebringer.");
		-- Summon: Crude Gauntlets Mold
		e.other:SummonItem(19633); -- Item: Crude Gauntlets Mold
	elseif(e.message:findi("greaves")) then
		e.self:Say("To create yer greaves material you will need to combine 4 Bricks of Crude Bronze, 1 Skunk Scent Gland , 1 Giant Scarab Egg Sack and 1 Small Lantern in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Greaves of the Axebringer.");
		-- Summon: Crude Greaves Mold
		e.other:SummonItem(19636); -- Item: Crude Greaves Mold
	elseif(e.message:findi("helm")) then
		e.self:Say("To create yer helm material you will need to combine 2 Bricks of Crude Bronze, 1 Aviak Chick Talon, 1 Spider Leg and 1 Fishing Bait in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Helm of the Axebringer.");
		-- Summon: Crude Helm Mold
		e.other:SummonItem(19631); -- Item: Crude Helm Mold
	elseif(e.message:findi("favor")) then
		e.self:Say("Well ya see young one, I am a dwarf and I like me Ale. But there is one thing that I like more then my Ale and that's me mug! While out in the mountains late one evening not too long ago I had a few too many then I should have me wife says. Har har. Anyways, when me woke up da next morning me mug was gone so I had to have lost it out there somewhere. If you should find my mug and were able to return it to me intact or not I would be very grateful! Return my mug to me along with 2 Pristine Krag Claws and I will reward you with a blade worthy of Brells finest battlemaster. Now git going!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28064, item2 = 28064, item3 = 28063})) then
		e.self:Say("I surely knew when I saw ye that ye would grow into a fine warrior of Brell and make me very proud! Well ye have done that indeed and I cannot tell ye how happy I am to have me stein back. Please take this Gem-Etched Battle Axe and may it guard you well in all of yer adventures to come. You have done well . Aye.");
			e.other:Faction(312,20); -- Storm Guard
			e.other:Faction(274,3); -- Kazon Stormhammer
			e.other:Faction(293,3); -- Miners Guild 249
			e.other:Faction(290,5); -- Merchants of Kaladim
			e.other:Faction(232,-5); -- Craknek Warriors
		e.other:QuestReward(e.self,{itemid = 26076}); -- Item: Gem-Etched Battle Axe
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
