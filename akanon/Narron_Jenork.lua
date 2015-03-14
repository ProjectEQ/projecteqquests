-- Quest edited by mrsmystic
-- Quest further edited by Qadar for compatibility with Watchman Boots quest (Watchman_Dexlin in northkarana)
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you, " .. e.other:GetName() .. "! I am Narron Jenork, High Watchman of Ak'anon. I am one of the most skilled Watchmans in all of Ak'anon, and I pride myself on training the most promising young warriors that Ak'anon has to offer. Are you a young gnome warrior?");
	elseif(e.message:findi("young gnome warrior")) then
		e.self:Say("Well, we can never get enough warriors around these parts, as far as I am concerned! Now if you are a new warrior, then you must go through the training to become a true watchman. I have a series of tests that will require you to test both your hunting and navigational skills. These tests will not leave you with nothing to show for your work, because upon completing them you will be outfitted with a full suit of Initiate Watchman's armor. Are you [ready to be tested]?");
	elseif(e.message:findi("ready to be tested")) then
		e.self:Say("Well then, let's get you started! First, I will present you with this Watchman's Mail Assembly kit to gather assorted items from both your training grounds of the Steamfont Mountains and in our great town of Ak'anon. You will then combine the different recipes of components in your kit to create a material that will be used with a mold in a forge to create your Watchman armor. When you are ready to craft a specific piece, all you must do is tell me what armor piece you want to craft, and I will present you with the recipe for the material, along with the mold. I have the material recipes necessary to make Initiate Watchman [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
		e.other:SummonItem(17255);
		e.other:Ding();
	elseif(e.message:findi("helm")) then
		e.self:Say("No watchman can even think of going into battle without the proper helmet, and I think this one will do the job for you, " .. e.other:GetName() .. ". To create your helm material, you will need to combine 2 Bricks of Crude Bronze, 1 Piece of Scrap Metal, 1 Ruined Cat Pelt and 1 Raw Bamboo in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Helm.");
		e.other:SummonItem(22610);
		e.other:Ding();
	elseif(e.message:findi("bracer")) then
		e.self:Say("Always a wise idea to keep your wrists well protected, because if you don't, you might have a difficult time swinging your weapons! To create your bracer material, you will need to combine 1 Brick of Crude Bronze, 1 Rusty Mace, 1 Kobold Tooth and 1 Bottle of Milk in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Bracer.");
		e.other:SummonItem(22611);
		e.other:Ding();
	elseif(e.message:findi("armguard")) then
		e.self:Say("One always has to be able to really pack a punch with their attacks, so preventing any injuries on your arms ahead of time is good planning! To create your armguards material, you will need to combine 2 Bricks of Crude Bronze, 2 Brownie Legs, and 1 Short Beer in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Armguards.");
		e.other:SummonItem(22613);
		e.other:Ding();
	elseif(e.message:findi("boots")) then
		e.self:Say("I certainly wouldn't advise any watchman to be on patrol without proper boots on. We aren't halflings, you know! Therefore our obsession should be with our tactical attacks, not our foothairs. To create your boot material, you will need to combine 3 Bricks of Crude Bronze, 1 Aviak Beak, 2 Wolf Meats and 1 Red Wine in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Boots.");
		e.other:SummonItem(22612);
		e.other:Ding();
	elseif(e.message:findi("greaves")) then
		e.self:Say("Pants are a must, young " .. e.other:GetName() .. ". As a Watchman of Ak'anon, you should be known for your noble deeds and commitment to defending your home, not as a gnome that runs around with no pants on. To create your greaves material, you will need to combine 4 Bricks of Crude Bronze, 1 Coyote Pelt, 1 Rusted Blackbox and 1 Bottle in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Greaves.");
		e.other:SummonItem(22614);
		e.other:Ding();
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("Having the necessary protection on your hands and wrists will prevent any serious injuries that would make you unable to defend yourself. To create your gauntlet material, you will need to combine 3 Bricks of Crude Bronze, 1 Runaway Clockwork Gearbox, 1 Young Ebon Drakewing, and 1 Minotaur Scalp in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Gauntlets.");
		e.other:SummonItem(22615);
		e.other:Ding();
	elseif(e.message:findi("breastplate")) then
		e.self:Say("I am very pleased to see that you have progressed so quickly in your training, " .. e.other:GetName() .. "! I do also agree that you are ready to gather the items necessary for crafting your Initiate Watchman's Breastplate. To create your breastplate material, you will need to combine 5 Bricks of Crude Bronze, 1 Runaway Clockwork Motor, 1 Brownie Brain, 1 Rusty Long Sword, 1 Grikbar Kobold Scalp and the evil Diloperia`s Bracer in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Breastplate. When you are finished with your breastplate, please come back to see me. I have a [final task] for you to complete.");
		e.other:SummonItem(22616);
		e.other:Ding();
	elseif(e.message:findi("final task")) then
		e.self:Say("Much like most of the other guildmasters in our great city, we have decided to begin presenting all new worthy recruits with weapons that symbolize their devotion to Ak'anon. I am in need of a [few items] from the mountains to make this weapon. If you will collect these items for me, I will be happy to reward you with one of these fine weapons.");
	elseif(e.message:findi("few items")) then
		e.self:Say("I will need for you to bring me 1 Clockwork Oil Extract, 1 Minotaur Tibia, 1 Young Ebon Drake Ribcage and 1 Renegade Clockwork Scrapmetal. Return to me after you have gathered this items and I will reward you with your weapon.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9111, item2 = 9112, item3 = 9113, item4 = 9114})) then
		e.self:Say("Well done, young " .. e.other:GetName() .. "! Since you have brought me the necessary items, I now present you with this Initiate Watchman's Long Sword. Use it worthily."); -- text made up
		e.other:SummonItem(9115);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12378})) then -- Box of Undead Brownies
		e.self:Say("Wonderful!! Watchman Dexlin sent word that you would be returning these specimens. I shall see that the Eldritch Collective gets them.  For you there is a reward. Manik has donated a pair of Watchman Boots!!");
		e.other:Faction(115,15,0); 	-- Gem Choppers better
		e.other:Faction(210,15,0); 	-- Merchants of Ak'Anon better
		e.other:Faction(176,15,0); 	-- King Ak'Anon better
		e.other:Faction(71,-15,0); 	-- Dark Reflection worse
		e.other:AddEXP(10000);
		e.other:Ding();
		e.other:SummonItem(12379);	-- Watchman Boots
		e.other:GiveCash(0,0,0,4);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
