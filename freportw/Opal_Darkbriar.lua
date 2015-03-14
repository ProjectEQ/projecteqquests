function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18739})) then -- A tattered not
		e.self:Say("Welcome to the Academy of Arcane Sciences. Here's one of our guild robes for you to wear. Now, let's get to work.");
		e.other:SummonItem(13558); -- Patched Violet Robe
		e.other:Ding();
		e.other:Faction(11,100,0); -- Arcane Scientists
		e.other:Faction(184,25,0); -- Knights of Truth
		e.other:Faction(235,-15,0); -- Opal Dark Briar
		e.other:Faction(105,-15,0); -- The Freeport Militia
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Opal_Darkbriar