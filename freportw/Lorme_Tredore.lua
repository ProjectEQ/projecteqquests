function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18740})) then -- A Tattered Note
		e.self:Say(string.format("Welcome to the Academy of Arcane Sciences. I am Lorme Tredore, Master Magician. Here is our guild robe, wear it with pride and represent us well, young %s. Now, let's get to work.",e.other:GetName()));
		e.other:SummonItem(13559);
		e.other:Ding();
		e.other:Faction(11,100,0); -- Arcane Scientists
		e.other:Faction(184,25,0); -- Knights of Truth
		e.other:Faction(235,-15,0); -- Opal Dark Briar
		e.other:Faction(105,-15,0); -- The Freeport Militia
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13951})) then -- Fleshy Orb
		e.self:Say("Ah. Thank you for bringing this to me! I will make very good use of it. Here take this small token of my appreciation in return. Guard Jenkins will no longer require it as he was killed on the training field yesterday. Tsk. tsk. tsk.");
		e.other:SummonItem(5353);
		e.other:Ding();
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Lorme_Tredore