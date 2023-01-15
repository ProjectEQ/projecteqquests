-- items: 19634, 19632, 19637, 19633, 19636, 19631, 19635, 19844, 17124
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes? What is it you want from me? I have nothing that you would be interested in. Not even money to pay the ridiculous taxes imposed by the Freeport Militia.");
	elseif(e.message:findi("dismal priest boots")) then
		e.self:Say("'To assemble Dismal priest Mail Boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Coyote Pelts, and two Large Fire Beetle Tarsi in the Mail Assembly Kit.");
		e.other:SummonItem(19634); -- Item: Crude Boot Mold
	elseif(e.message:findi("dismal priest bracer")) then
		e.self:Say("To assemble a Dismal priest Mail Bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Coyote Pelt and a Sand Scarab Hatchling Sternite in the Mail Assembly Kit.");
		e.other:SummonItem(19632); -- Item: Crude Bracer Mold
	elseif(e.message:findi("dismal priest breastplate")) then
		e.self:Say("To assemble a Dismal priest Breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Coyote Pelt, a Giant Fire Beetle Carapace, and two Giant Fire Beetle Tergites in the Mail Assembly Kit.");
		e.other:SummonItem(19637); -- Item: Crude Breastplate Mold
	elseif(e.message:findi("dismal priest gauntlets")) then
		e.self:Say("To assemble Dismal priest Gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Coyote Pelt and two Sand Scarab Hatchling Tarsi in the Mail Assembly Kit.");
		e.other:SummonItem(19633); -- Item: Crude Gauntlets Mold
	elseif(e.message:findi("dismal priest greaves")) then
		e.self:Say("To assemble Dismal priest Greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Coyote Pelts and two Large Fire Beetle Sternites in the Mail Assembly Kit.");
		e.other:SummonItem(19636); -- Item: Crude Greaves Mold
	elseif(e.message:findi("dismal priest helm")) then
		e.self:Say("To assemble a Dismal priest Helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Coyote Pelt and two Sand Scarab Hatchling Eyes in the Mail Assembly Kit.");
		e.other:SummonItem(19631); -- Item: Crude Helm Mold
	elseif(e.message:findi("dismal priest vambraces")) then
		e.self:Say("To assemble Dismal priest Vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Coyote Pelt and two Large Fire Beetle Patella in the Mail Assembly Kit.");
		e.other:SummonItem(19635); -- Item: Crude Vambrace Mold
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19844})) then -- Note to Jerra Renlock
		e.self:Say("'Ah, so Zhem wants me to assist you with some armor. You will surely need it if you are an associate of the likes of him. This Mail Assembly Kit will be needed for you to construct your armor. The materials required depend on the armor section you plan to construct. Do you plan to construct a [dismal priest helm], a [dismal priest bracer], [dismal priest gauntlets], [dismal priest boots], [dismal priest vambraces], [dismal priest greaves], or a [dismal priest breastplate].");
		e.other:SummonItem(17124); -- Mail Assembly Kit
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end