function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18747})) then
		e.self:Say("Welcome to the guild. here's your guild tunic. Now. let's get to work.");
		e.other:SummonItem(13571);
		e.other:Ding();
		e.other:Faction(192,100,0);
		e.other:Faction(184,15,0);
		e.other:Faction(135,15,0);
		e.other:Faction(273,-5,0);
		e.other:Faction(207,-5,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportn  -- Caskin_Marsheart