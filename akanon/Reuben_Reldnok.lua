function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. "! I am Reuben Reldnok. first Paladin of the Deep Muses. When I was just a young lad I journeyed to Kaladim. the home of our cousins the Dwarves. At the Temple of the Duke of Below I studied the ways of a Paladin of our creator Brell Serilis. I have returned to Ak'Anon to train interested young gnomes the ways I have mastered so that we may defend Ak'Anon and Brells disciples everywhere from the threats that would see us destroyed. If you are a Paladin of the Deep Muses I have some [armor quests] for you to complete.");
	elseif(e.message:findi("armor quests")) then
		e.self:Say("I have armor quests that I present to young gnomish paladins when they are ready to venture out into the Mountains of Steamfont and begin their training. Are you a gnome that is [ready for training]?");
	elseif(e.message:findi("ready for training")) then
		e.self:Say("Fantastic! Let me first begin by telling you how you will create your armor young " .. e.other:GetName() .. ". I will present you with a Tinkerers Mail Assembly Kit that you will use to collect all different kinds of items from Ak'anon and from the Steamfont Mountaints. You will use specific [armor recipes] in this kit to create materials that you will use along with the molds I provide you with in a forge to create your armor!");
		e.other:SummonItem(17252);
		e.other:Ding();
	elseif(e.message:findi("armor recipe")) then
		e.self:Say("I have all the armor recipes and molds that you will need to get started all you must do is simply tell me what armor piece you [want to craft]. I can provide you with the recipes and molds for Deep Muses [Helms]. [Bracers]. [Armguards]. [Boots]. [Greaves]. [Gauntlets] and [Breastplates]. I must recommend that you attempt to gather the items for your breastplate last because the components required for it are the most difficult to collect.");
	elseif(e.message:findi("helm")) then
		e.self:Say("That's a great idea young " .. e.other:GetName() .. ". Having good helm on the ol noggin will protect you from many hamrful attacks. To create your helm material you will need to combine 2 Bricks of Crude Bronze. 1 Ruined Cat Pelt. 1 Rat Tooth and 1 Gnomish Spirits in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Deep Muses Helm.");
		e.other:SummonItem(22610);
		e.other:Ding();
	elseif(e.message:findi("breastplate")) then
		e.self:Say("It pleases me to see that you have come this far in your training. When you complete your breastplate and round out your armor set you will truly be a worthy paladin of Brell. To create your breastplate material you will need to combine 5 Bricks of Crude Bronze. 1 Grikbar Kobold Scalp. 1 Low Quality Coyote Pelt. 1 Micro Servo 1 Scrap Metal and the evil warrior Berinsan`s Shirt in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Deep Muses Breastplate. When you have crafted your breastplate please come back to see me for I might have a [special duty] for you to perform.");
		e.other:SummonItem(22616);
		e.other:Ding();
	elseif(e.message:findi("boot")) then
		e.self:Say("I wouldn't recommend going out in the Mountains without some Boots on " .. e.other:GetName() .. ". Who knows what kobold surprise you might find out there! To create your boot material you will need to combine 2 Bricks of Crude Bronze. 2 Spiderling Silks. 2 Flasks of Water and 1 Iron Oxide in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Deep Muses Boots.");
		e.other:SummonItem(22612);
		e.other:Ding();
	elseif(e.message:findi("greave")) then
		e.self:Say("I would definitely agree that some pants are in order. To create your greaves material you will need to combine 4 Bricks of Crude Bronze. 1 Spiderling Eyes. 1 Minotaur Horn. 1 Bottle of Kalish and the dastardly rogue Galorin`s Head in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Deep Muses Greaves.");
		e.other:SummonItem(22614);
		e.other:Ding();
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("Gauntlets are a very good idea indeed to keep your hands protected while on the battlefield. To create your gauntlet material you will need to combine 3 Bricks of Crude Bronze. 1 Diseased Bone Marrow. 1 Harpy Wing. 1 Aviak Talon and 1 Moss Covered Drake Scale in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Deep Muses Gauntlets.");
		e.other:SummonItem(22615);
		e.other:Ding();
	elseif(e.message:findi("bracer")) then
		e.self:Say("A bracer is what you wish to craft eh? Well if you think you are ready you will need to collect 1 Brick of Crude Bronze, 1 Grikbar Kobold Scalp, 1 Rat Whisker and 1 Short Ale. Once you have created the proper material in your kit take it to a forge along with this mold to fashion your very own Deep Muses Bracer.");
		e.other:SummonItem(22611);
		e.other:Ding();
	elseif(e.message:findi("armguard")) then
		e.self:Say("Any smart paladin knows that your arms must be well guarded in battle. How else would you be able to swing your blade in Brells name! To create your armguard material you will need to combine 3 Bricks of Crude Bronze, 1 Ruined Coyote Pelt, 2 Bone Chips and 1 Russet Oxide in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Deep Muses Armguards.");
		e.other:SummonItem(22613);
		e.other:Ding();
	elseif(e.message:findi("special duty")) then
		e.self:Say("I'm glad to see you are back, it is clear that you have progressed very well in your training for you to be here ready for this task. I am constructing a blade for all of our new recruits to carry. If you [gather the items] I need I might be able to craft you one as well. ");
	elseif(e.message:findi("gather the item")) then
		e.self:Say("Thank you for your willingness to help Gearsword. I must warn you though I need some items from monsters and areas that are quite treacherous so I would recommend you take some worthy companions with you if you are to venture out on this quest. Are you [up for the challenge]?");
	elseif(e.message:findi("up for the challenge")) then
		e.self:Say("Ok I will need 4 things to construct this blade. Bring me a Finished Sheet of Metal, a Kobold Backbone, Preserved Rat Pelt and 1 Bottle of Clockwork Oil that was stolen from me from some renegade clockworks not too long ago. Once I have these items I can make you a sword worthy of Brells finest heroes.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if (item_lib.check_turn_in(e.trade, {item1 = 9100,item2 =  9101,item3 =  9102,item4 =  9103})) then
		e.self:Say("Here " .. e.other:GetName() .. " , I have crafted this for you! May it always strike true!");
		e.other:SummonItem(9104);
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
