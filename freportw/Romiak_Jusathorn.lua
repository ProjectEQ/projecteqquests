function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18741})) then -- A tattered note
		e.self:Say("Greetings, I am Romiak Jusathorn, Master Enchanter of the Academy. Take this.. it's our guild robe; it will help protect you in this harsh environment. Now, let's get to work!");
		e.other:SummonItem(13560); -- Old Violet Robe
		e.other:Ding();
		e.other:Faction(11,100,0); -- Arcane Scientists
		e.other:Faction(184,25,0); -- Knights of Truth
		e.other:Faction(235,-15,0); -- Opal Dark Briar
		e.other:Faction(105,-15,0); -- The Freeport Militia
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Romiak_Jusathorn