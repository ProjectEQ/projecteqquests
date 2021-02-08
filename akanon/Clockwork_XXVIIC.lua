-- Converted to .lua by Speedz
-- items: 13844, 13214

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);
	if (item_lib.check_turn_in(e.trade, {item1 = 13844})) then	-- Item: Shiny Card
		if(fac <= 5) then	-- Indifferent or better
			e.self:Say("Tick.. Pop.. Access granted.");
			e.other:Ding();
			e.other:SummonItem(13214); -- Item: Blackbox XXVIIC
			e.other:Faction(333,1,0); -- Faction: King Ak`Anon
			e.other:Faction(245,1,0); -- Faction: Eldritch Collective
			e.other:Faction(255,1,0); -- Faction: Gem Choppers
			e.other:Faction(238,-1,0); -- Faction: Dark Reflection
			e.other:Faction(287,-1,0); -- Faction: Meldrath
			e.other:AddEXP(100);
		else
   			e.self:Say("Tick... You are not yet authorized to receive that information. Further service to the state is required. Have a nice day.");
   			e.other:SummonItem(13844); -- Item: Shiny Card
   		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
