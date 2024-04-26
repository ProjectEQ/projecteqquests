-- items: 18651, 18652, 18653, 18654
function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Ah, so many dead to destroy, so little time. What is it you want? You seek the [potions] perhaps?");
	elseif e.message:findi("potions") then
		e.self:Say("Give me the four clues.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if item_lib.check_turn_in(e.trade, {item1 = 18651, item2 = 18652, item3 = 18653, item4 = 18654}) then
		e.other:QuestReward(e.self,0,0,0,0,13984,100); -- Item: Crate of Potions
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
