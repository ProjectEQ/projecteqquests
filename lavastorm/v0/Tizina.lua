function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {gold = 50})) then
		-- Confirmed Live Experience
		e.self:Say("Since you have given me gold, I will give you gloves. For more magic gloves, give a bloodstone to Tarn Visilin in the High Keep library.");
		e.other:QuestReward(e.self,0,0,0,0,2354,1); -- Item: Enchanted Gloves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414