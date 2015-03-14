-- Converted to .lua by Speedz

function event_say(e)
	if (e.message:findi("plague knight boot")) then
		e.self:Say("To assemble Plague Knight Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Cat Pelts, and two Clockwork Rat Belly Plates in the Mail Assembly Kit.");
		e.other:SummonItem(19634);
		e.other:Ding();
	elseif (e.message:findi("plague knight bracer")) then
		e.self:Say("To assemble a Plague Knight Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Cat Pelt and a Clockwork Rat Leg Section in the Mail Assembly Kit.");
		e.other:SummonItem(19632);
		e.other:Ding();
	elseif (e.message:findi("plague knight breastplate")) then
		e.self:Say("To assemble a Plague Knight Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Medium Quality Cat Pelt, a Clockwork Spider Thorax Plate, and a Clockwork Spider Abdomen Plate in the Mail Assembly Kit.");
		e.other:SummonItem(19637);
		e.other:Ding();
	elseif (e.message:findi("plague knight gauntlet")) then
		e.self:Say("To assemble Plague Knight Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Cat Pelt and two Clockwork Rat Back Plates in the Mail Assembly Kit.");
		e.other:SummonItem(19633);
		e.other:Ding();
	elseif (e.message:findi("plague knight greave")) then
		e.self:Say("To assemble Plague Knight Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Low Quality Cat Pelts and four Clockwork Spider Leg Sections in the Mail Assembly Kit.");
		e.other:SummonItem(19636);
		e.other:Ding();
	elseif (e.message:findi("plague knight helm")) then
		e.self:Say("To assemble a Plague Knight Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Cat Pelt and two Clockwork Spider Eye Lenses in the Mail Assembly Kit.");
		e.other:SummonItem(19631);
		e.other:Ding();
	elseif (e.message:findi("plague knight vambrace")) then
		e.self:Say("To assemble Plague Knight Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Low Quality Cat Pelt and two Clockwork Spider Leg Sections in the Mail Assembly Kit.");
		e.other:SummonItem(19635);
		e.other:Ding();
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10987})) then
		e.self:Say("Hail " .. e.other:GetName() .. "! You must be one of Garret's new knights. Garret has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Knight Armor you are planning on assembling. Do you wish to craft a [plague knight helm], a [plague knight bracer], [plague knight gauntlets], [plague knight boots], [plague knight vambraces], [plague knight greaves], or a [plague knight breastplate].");
		e.other:SummonItem(17124);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
