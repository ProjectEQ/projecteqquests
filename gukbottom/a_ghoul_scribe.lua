-- Ink of the dark - enchanter epic lead in quest

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10626})) then
		e.self:Say("Crroooaak! Crrroooooaaakk!");
		e.other:SummonItem(10601);
		e.other:Ding();
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: gukbottom ID: 66170 NPC: a_ghoul_scribe