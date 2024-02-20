-- items: 2354
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {gold = 50})) then
		e.self:Say("Since you have given me gold, I will give you gloves. For more magic gloves, give a bloodstone to Tarn Visilin in the Highkeep library.");
		e.other:SummonItem(2354); -- Item: Enchanted Gloves
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
