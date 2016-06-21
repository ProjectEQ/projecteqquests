function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["ench_epic"] >= "2" and e.other:GetFaction(e.self) < 5) then	
		if(item_lib.check_turn_in(e.trade, {item1 = 52964})) then		
			e.self:Say("I can't . . I . . .of course, I do not think that Tserrina has any need for this. I can't imagine that she would miss it at all. Please, take it.");
			e.other:SummonItem(54289);
		end
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end

