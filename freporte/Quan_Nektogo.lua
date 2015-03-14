function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Sorry friend. I have nothing to sell at the moment. These taxes imposed by the Freeport Militia and the Coalition of Tradefolk take a heavy toll on us poor folk.");
	elseif(e.message:findi("forge")) then
		e.self:Say("You can find them all over freeport. Inside and out of many of the buildings where Weapons and armor are sold.");
	elseif(e.message:findi("dismal knight boots")) then
		e.self:Say("To assemble Dismal Knight Boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Cat Pelts, and two Large Leaf Scarab Tarsi in the Mail Assembly Kit.");
		e.other:SummonItem(19634);
	elseif(e.message:findi("dismal knight bracer")) then
		e.self:Say("To assemble a Dismal Knight Bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Cat Pelt and a Leaf Scarab Sternite in the Mail Assembly Kit.");
		e.other:SummonItem(19632);
	elseif(e.message:findi("dismal knight breastplate")) then
		e.self:Say("To assemble a Dismal Knight Breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Medium Quality Cat Pelt, a Giant Leaf Scarab Carapace, and two Giant Leaf Scarab Tergites in the Mail Assembly Kit.");
		e.other:SummonItem(19637);
	elseif(e.message:findi("dismal knight gauntlets")) then
		e.self:Say("To assemble Dismal Knight Gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Cat Pelt and two Leaf Scarab Tarsi in the Mail Assembly Kit.");
		e.other:SummonItem(19633);
	elseif(e.message:findi("dismal knight greaves")) then
		e.self:Say("To assemble Dismal Knight Greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Cat Pelts and two Large Leaf Scarab Sternites in the Mail Assembly Kit.");
		e.other:SummonItem(19636);
	elseif(e.message:findi("dismal knight helm")) then
		e.self:Say("To assemble a Dismal Knight Helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Cat Pelt and two Large Leaf Scarab Eyes in the Mail Assembly Kit.");
		e.other:SummonItem(19631);
	elseif(e.message:findi("dismal knight vambraces")) then
		e.self:Say("To assemble Dismal Knight Vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Cat Pelt and two Large Leaf Scarab Patella in the Mail Assembly Kit.");
		e.other:SummonItem(19635);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19928,item2 = 19852})) then
		e.self:Emote("fashions a grip out of the giant rattlesnake skin and polishes the blade of the sword with a strange glowing substance. 'May your new sword see the deaths of many enemies!'");
		e.other:SummonItem(19940);
		e.other:Ding();
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 19845})) then
		e.self:Say("Sorry buddy I didn't realize you were one of us. I've got no problem helping out an associate of Gunex. You'll need this Mail Assembly Kit to construct your new armor. The materials required depend on the section of armor you're planning on crafting. Do you plan on crafting a [dismal knight helm], a [dismal knight bracer], [dismal knight gauntlets], [dismal knight boots], [dismal knight vambraces], [dismal knight greaves], or a [dismal knight breastplate].");
		e.other:SummonItem(17124);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
