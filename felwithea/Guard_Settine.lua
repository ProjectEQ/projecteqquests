-- items: 18901, 14640
function event_trade(e)
	local item_lib = require("items");

    if(item_lib.check_turn_in(e.trade, {item1 = 18901})) then 
		e.self:Say("I.. but.. she.. You can take this. I guess I don't need it any more.");
		e.other:Ding();
		e.other:AddEXP(100);
		e.other:SummonItem(14640); -- Item: Silver Amber Ring
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
