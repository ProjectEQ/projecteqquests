function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am but a poor peddler of trinkets living amongst the rats and beggars of these slums. Perhaps you will purchase some of my wares and help a struggling merchant?");
	elseif(e.message:findi("forge")) then
		e.self:Say("You can find forges all over freeport.");
	elseif(e.message:findi("dismal warrior breastplate")) then
		e.self:Say("'To assemble a Dismal Warrior Breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Coyote Pelt, a Dune Tarantula Thorax, and a Dune Tarantula Abdomen in the Mail Assembly Kit.");
		e.other:SummonItem(19637);
	elseif(e.message:findi("dismal warrior helm")) then
		e.self:Say("To assemble a Dismal Warrior Helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Coyote Pelt and two Desert Tarantula Eyes in the Mail Assembly Kit.");
		e.other:SummonItem(19631);
	elseif(e.message:findi("dismal warrior bracer")) then
		e.self:Say("To assemble a Dismal Warrior Mail Bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Coyote Pelt and a Dune Spiderling Tibia in the Mail Assembly Kit.");
		e.other:SummonItem(19632);
	elseif(e.message:findi("dismal warrior gauntlet")) then
		e.self:Say("To assemble Dismal Warrior Gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Coyote Pelt and two Dune Spiderling Tarsi in the Mail Assembly Kit.");
		e.other:SummonItem(19633);
	elseif(e.message:findi("dismal warrior boot")) then
		e.self:Say("To assemble Dismal Warrior Mail Boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Coyote Pelts, and two Dune Spiderling Hairs in the Mail Assembly Kit.");
		e.other:SummonItem(19632);
	elseif(e.message:findi("dismal warrior vambrace")) then
		e.self:Say("To assemble Dismal Warrior Vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Coyote Pelt and two Desert Tarantula Patella in the Mail Assembly Kit.");
		e.other:SummonItem(19635);
	elseif(e.message:findi("dismal warrior greave")) then
		e.self:Say("To assemble Dismal Warrior Greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Coyote Pelts and two Desert Tarantula Femurs in the Mail Assembly Kit.");
		e.other:SummonItem(19636);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 26644})) then
		e.self:Say("I see now we have similar interests. I will help you get outfitted in an affordable suit of armor to help you in your endeavors. You will need this Mail Assembly Kit to aid you in the construction of the armor. The materials required depend on the armor section you desire to craft. Do you plan to construct a [dismal warrior helm], a [dismal warrior bracer], [dismal warrior gauntlets], [dismal warrior boots], [dismal warrior vambraces], [dismal warrior greaves], or a [dismal warrior breastplate].");
		e.other:SummonItem(17124);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
