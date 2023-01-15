-- items: 15793, 17589, 17319, 17496, 17286, 17370, 17700, 17759, 16779
function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(qglobals["berserk_epic"] ~= nil and qglobals["berserk_epic"] >= "1" and item_lib.check_turn_in(e.trade, {item1 = 15793, item2 = 17589, item3 = 17319, item4 = 17496})) then
		e.self:Say("What's this ye got here? From Keras, ye say? Hmm. . .let me look at this. Aye, these aren't ordinary pieces of ore fer sure. Don't tell me that that son of a she-wolf finally managed to sucker someone into helping him make that Taelosian Tempered Ore he's been blathering about! Hah! But as surely as Ogres are stupid here it is! Fer me to truly understand what this ore is capable of will take me some time you understand. So in the meantime, fetch me some Darkwood Sapling Branches. If Keras is right, only this wood will make suitable handles.");
		eq.set_global("berserk_epic","2",5,"F");
	end
	if(qglobals["berserk_epic"] ~= nil and qglobals["berserk_epic"] >= "2" and item_lib.check_turn_in(e.trade, {item1 = 17286, item2 = 17286, item3 = 17286, item4 = 17286})) then
		e.self:Emote("looks pleased to see you.  Excellent timing friend! I just finished turning the ore samples you brought me earlier into some fine axe heads. It'll be but a moment till I complete the axes . . . The only thing that remains is they need to be thoroughly tested against a very hard-skinned creature, which will allow us to discover their durability. Deep within the recesses of Old Sebilis reside several golems of massive proportions. Slay the largest of these golems to test these axes out thoroughly. Return to Keras with the result so that he may inspect his handywork.");
		e.other:SummonItem(17370); -- Item: Trial Taelosian Alloy Blood Axe
		e.other:SummonItem(17700); -- Item: Trial Taelosian Alloy Blood Axe
		e.other:SummonItem(17759); -- Item: Trial Taelosian Alloy Blood Axe
		e.other:SummonItem(16779); -- Item: Trial Taelosian Alloy Blood Axe
		eq.set_global("berserk_epic","3",5,"F");		
	end
	item_lib.return_items(e.self, e.other, e.trade);	
end



