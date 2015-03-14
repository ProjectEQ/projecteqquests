function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and salutations "..e.other:GetName()..". I am Miltiades Tal`Azroth Crusader of Karana. I have spent all of my years here in Qeynos and gathered infinite knowledge from my teachers on my path to enlightenment. I have also started training new recruits to help them find their calling as a Holy Warrior of Karana. If you are a [Paladin of Karana] I might have some tasks for you to complete.");
	elseif(e.message:findi("paladin of karana")) then
		e.self:Say("That is excellent news "..e.other:GetName()..". As a Knight in training of Karana I would like to offer you a series of [tests] what will test your devotion to yourself and your god.");
	elseif(e.message:findi("test")) then
		e.self:Say("I have put together a series of tests that will enable our new recruits to create their own armor. You will use a Rainkeepers Assembly Kit to combine assorted items that you will collect from both the hunting areas surround Qeynos and the city itself. Combining these magical items in your kit will create a material that you will place in a forge along with molds that I will present to you to create your armor. Are you ready to start [fashioning your materials]?");
	elseif(e.message:findi("fashioning your materials")) then
		e.self:Say("Excellent "..e.other:GetName()..". Please take this Rainkeepers Assembly Kit. Now for your materials you will fashion you will obviously need to know what items are used for what armor materials. Simply tell me what armor piece you [want] to create and I will present you with the recipe for that specific armor material. I can present you with the molds and recipes necessary for creating Rainkeeper [Helm], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplate].");
		e.other:SummonItem(17264); 
	elseif(e.message:findi("armguard")) then
		e.self:Say("Here is your Rainkeepers Armguards Mold. To create your armguard material you will need to combine 2 Bricks of Crude Iron, 1 Snake Fang and 1 Burned Out Lightstone and 1 Fishing Bait in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Rainkeeper.");
		e.other:SummonItem(22613);
	elseif(e.message:findi("boot")) then
		e.self:Say("Here is your Rainkeepers Boot Mold. To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Patch of Gnoll Fur, 1 Giant Snake Fang and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boots of the Rainkeeper.");
		e.other:SummonItem(22612);
	elseif(e.message:findi("bracer")) then
		e.self:Say("Here is your Rainkeepers Bracer Mold. To create your bracer material you will need to combine 1 Brick of Crude Iron, 2 Gnoll Pup Scalps, 1 Patch of Gnoll Fur and 1 Water Flask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Rainkeeper.");
		e.other:SummonItem(22611);
	elseif(e.message:findi("breastplate")) then
		e.self:Say("Here is your Rainkeepers Breastplate Mold. To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Coyote Skull, 1 Golden Bandit Tooth, 1 Young Plains Cat Scalp, 1 Diseased Wolf Pelt and 1 Lightstone in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Rainkeeper. Please come back to see me after you have created your breastplate because I have one [final favor] to ask of you.");
		e.other:SummonItem(22616);
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("Here is your Rainkeepers Gauntlets Mold. To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Chunk of Meat, 1 Shadow Wolf Paw, and 2 Giant Fire Beetle Eyes in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Rainkeeper.");
		e.other:SummonItem(22615);
	elseif(e.message:findi("greave")) then
		e.self:Say("Here is your Rainkeepers Greaves Mold. To create your greaves material you will need to combine 4 Bricks of Crude Iron, 2 Ruined Lion Skins, 1 Spider Legs and 1 Bottle in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Rainkeeper.");
		e.other:SummonItem(22614);
	elseif(e.message:findi("helm")) then
		e.self:Say("Here is your Rainkeepers Helm Mold. To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Patch of Gnoll Fur, 1 Large Snake Skin and 1 Fish Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Rainkeeper.");
		e.other:SummonItem(22610);
	elseif(e.message:findi("final favor")) then
		e.self:Say("In the past I have sent some of my finest messengers to Qeynos Hills to deliver messages to the Sayers about current events in Qeynos. However the last few I have sent did not return so I began to look into what might have happened when I received word that the Bloodsabers had claimed responsibility for the slayings. I must ask that you bring me the head of a certain Bloodsaber who I think is [responsible] for the slayings.");
	elseif(e.message:findi("responsible")) then
		e.self:Say("I have reason to believe that Tovax Vmar is behind this, a dreaded necromancer that has been known to prowl the hills. Having Tovax dead will surely send a message to the Bloodsabers to tread lightly for their days are numbered. If you are able to find Tovax return to me his necklace along with 2 Enchanted Wisp Globes and I will reward you with a weapon suitable for a true knight of Karana.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 27414, item2 =27415, item3 = 27415})) then
		e.self:Say("Good! Now the Bloodsabers know that Karana will not allow them to live forever! Here, take this to aid you.");
		e.other:SummonItem(27488);
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1018 -- Miltiades_Tal`Azroth 
