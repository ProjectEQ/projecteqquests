-- Converted to .lua by Speedz
-- items: 19631, 19633, 19632, 19634, 19635, 19636, 19637, 10989, 17124

function event_say(e)
	if (e.message:findi("plague raiser helm")) then
		e.self:Say("To assemble a Plague Raiser Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Coyote Pelt and two Yellow Recluse Eyes in the Mail Assembly Kit.");
		e.other:SummonItem(19631); -- Item: Crude Helm Mold
		e.other:Ding();
	elseif (e.message:findi("plague raiser gauntlet")) then
		e.self:Say("To assemble Plague Raiser Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Coyote Pelt and two Clockwork Spider Mesh in the Mail Assembly Kit.");
		e.other:SummonItem(19633); -- Item: Crude Gauntlets Mold
		e.other:Ding();
	elseif (e.message:findi("plague raiser bracer")) then
		e.self:Say("To assemble a Plague Raiser Mail Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Coyote Pelt and a Clockwork Spider Mesh in the Mail Assembly Kit.");
		e.other:SummonItem(19632); -- Item: Crude Bracer Mold
		e.other:Ding();
	elseif (e.message:findi("plague raiser boot")) then
		e.self:Say("To assemble Plague Raiser Mail Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Coyote Pelts, and two Clockwork Spider Mesh in the Mail Assembly Kit.");
		e.other:SummonItem(19634); -- Item: Crude Boot Mold
		e.other:Ding();
	elseif (e.message:findi("plague raiser vambrace")) then
		e.self:Say("To assemble Plague Raiser Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Low Quality Coyote Pelt and three Clockwork Spider Mesh in the Mail Assembly Kit.");
		e.other:SummonItem(19635); -- Item: Crude Vambrace Mold
		e.other:Ding();
	elseif (e.message:findi("plague raiser greave")) then
		e.self:Say("To assemble Plague Raiser Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Low Quality Coyote Pelts and three Clockwork Spider Mesh in the Mail Assembly Kit.");
		e.other:SummonItem(19636); -- Item: Crude Greaves Mold
		e.other:Ding();
	elseif (e.message:findi("plague raiser breastplate")) then
		e.self:Say("To assemble a Plague Raiser Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Coyote Pelt, a Clockwork Spider Thorax Plate, and two Ebon Drake Wings in the Mail Assembly Kit.");
		e.other:SummonItem(19637); -- Item: Crude Breastplate Mold
		e.other:Ding();
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10989})) then
		e.self:Say("Hail " .. e.other:GetName() .. "! You must be one of Derthix new disciples. Derthix has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Raiser Armor you are planning on assembling. Do you wish to craft a [plague raiser helm], a [plague raiser bracer], [plague raiser gauntlets], [plague raiser boots], [plague raiser vambraces], [plague raiser greaves], or a [plague raiser breastplate].");
		e.other:SummonItem(17124); -- Mail Assembly Kit
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
