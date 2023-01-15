-- Converted to .lua by Speedz
-- items: 19634, 19632, 19637, 19633, 19636, 19631, 19635, 10987, 17124

function event_say(e)
	if (e.message:findi("plague knight boot")) then
		e.self:Say("To assemble Plague Knight Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Cat Pelts, and two Clockwork Rat Belly Plates in the Mail Assembly Kit.");
		e.other:SummonItem(19634); -- Item: Crude Boot Mold
		e.other:Ding();
	elseif (e.message:findi("plague knight bracer")) then
		e.self:Say("To assemble a Plague Knight Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Cat Pelt and a Clockwork Rat Leg Section in the Mail Assembly Kit.");
		e.other:SummonItem(19632); -- Item: Crude Bracer Mold
		e.other:Ding();
	elseif (e.message:findi("plague knight breastplate")) then
		e.self:Say("To assemble a Plague Knight Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Medium Quality Cat Pelt, a Clockwork Spider Thorax Plate, and a Clockwork Spider Abdomen Plate in the Mail Assembly Kit.");
		e.other:SummonItem(19637); -- Item: Crude Breastplate Mold
		e.other:Ding();
	elseif (e.message:findi("plague knight gauntlet")) then
		e.self:Say("To assemble Plague Knight Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Cat Pelt and two Clockwork Rat Back Plates in the Mail Assembly Kit.");
		e.other:SummonItem(19633); -- Item: Crude Gauntlets Mold
		e.other:Ding();
	elseif (e.message:findi("plague knight greave")) then
		e.self:Say("To assemble Plague Knight Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Low Quality Cat Pelts and four Clockwork Spider Leg Sections in the Mail Assembly Kit.");
		e.other:SummonItem(19636); -- Item: Crude Greaves Mold
		e.other:Ding();
	elseif (e.message:findi("plague knight helm")) then
		e.self:Say("To assemble a Plague Knight Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Cat Pelt and two Clockwork Spider Eye Lenses in the Mail Assembly Kit.");
		e.other:SummonItem(19631); -- Item: Crude Helm Mold
		e.other:Ding();
	elseif (e.message:findi("plague knight vambrace")) then
		e.self:Say("To assemble Plague Knight Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Low Quality Cat Pelt and two Clockwork Spider Leg Sections in the Mail Assembly Kit.");
		e.other:SummonItem(19635); -- Item: Crude Vambrace Mold
		e.other:Ding();
	elseif (e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetCleanName() .. "! You must be one of Garret's new knights. Garret has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Knight Armor you are planning on assembling. Do you wish to craft a [plague knight helm], a [plague knight bracer], [plague knight gauntlets], [plague knight boots], [plague knight vambraces], [plague knight greaves], or a [plague knight breastplate].");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10987})) then
		e.self:Say("Hail " .. e.other:GetName() .. "! You must be one of Garret's new knights. Garret has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Knight Armor you are planning on assembling. Do you wish to craft a [plague knight helm], a [plague knight bracer], [plague knight gauntlets], [plague knight boots], [plague knight vambraces], [plague knight greaves], or a [plague knight breastplate].");
		e.other:SummonItem(17124); -- Item: Mail Assembly Kit
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
