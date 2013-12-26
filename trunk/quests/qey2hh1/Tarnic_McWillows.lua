function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 21987})) then -- need correct text
		e.self:Say("It has been a long time since someone has come for my herbs.  I do still have them however.  I knew that the elves would remember I was out here.  Here is the antidote you require.");
		e.other:SummonItem(21988);
		e.other:Ding();
		e.other:AddEXP(0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
