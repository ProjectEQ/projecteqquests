-- ancient pattern subquest -- ranger/druid epic

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20458})) then
		e.self:Say("You hardly look like the type of errand runner Farios usually sends out to fetch his groceries but here they are. I hope he chokes on them. Oh, and tell him he still owes me five gold for his last order!");
		e.other:SummonItem(20459);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF zone: felwithea ID: 61034 NPC: Merchant_Nora