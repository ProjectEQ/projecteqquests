-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13844})) then
		e.self:Say("Tick.. Pop.. Access granted.");
		e.other:Ding();
		e.other:SummonItem(13212); -- Item: Blackbox XIIC
		e.other:Faction(333,1,0); -- Faction: King Ak`Anon
		e.other:Faction(245,1,0); -- Faction: Eldritch Collective
		e.other:Faction(255,1,0); -- Faction: Gem Choppers
		e.other:Faction(238,-1,0); -- Faction: Dark Reflection
		e.other:Faction(287,-1,0); -- Faction: Meldrath
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
