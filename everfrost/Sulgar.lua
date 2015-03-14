function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am searching for the [wheel of Tarton]. If you will assist me I will provide you with [runes] to create a powerful spell.");
	elseif(e.message:findi("runes")) then
		e.self:Say("I have these runes, Rune of Frost and Rune of the Astral, which can be combined to produce a powerful spell that can call down destruction from the heavens. I will give them to you in exchange for the Staff of the Wheel and Star of Eyes");
	elseif(e.message:findi("case")) then
		e.self:Say("You can use this case to reassemble the wheel. It has been infused with energy to combine the spokes. You will need to work quickly though or it will consume itself.");
		e.other:SummonItem(17510); -- a glowing chest - quest combiner
	elseif(e.message:findi("wheel")) then
		e.self:Say("The wheel was broken into several pieces and scattered throughout the world. This book will give you clues as to their whereabouts. Once you gather all the pieces, they can be reassembled in a special [case]");
		e.other:SummonItem(18031); -- Tome of the Wheel
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 14360,item2 = 14361})) then -- Staff of the Wheel / Star of Eyes
		e.self:Say("Wonderful, you have brought me the Wheel. Here is the reward I promised you.");
		e.other:SummonItem(11880); -- Rune of Frost
		e.other:SummonItem(11881); -- Rune of the Astral
		e.other:Ding();
		e.other:AddEXP(100000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Sulgar