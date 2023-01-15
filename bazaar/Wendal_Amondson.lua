-- items: 21810, 21820, 21811, 21821, 21812, 21822, 21813, 21823
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". If you're looking to sell a black horse, I'll be happy to give you a fair price.  If you've got a different color horse you'd like to sell talk to one of my brothers.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 21810})) then
		e.other:SummonItem(21820); -- Item: Bag of Platinum Pieces

	elseif(item_lib.check_turn_in(e.trade, {item1 = 21811})) then
		e.other:SummonItem(21821); -- Item: Heavy Bag of Platinum

	elseif(item_lib.check_turn_in(e.trade, {item1 = 21812})) then
		e.other:SummonItem(21822); -- Item: Big Bag of Platinum

	elseif(item_lib.check_turn_in(e.trade, {item1 = 21813})) then
		e.other:SummonItem(21823); -- Item: Huge Bag of Platinum
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
