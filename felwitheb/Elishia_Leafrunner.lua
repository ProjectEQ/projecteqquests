-- items: 8970, 8969
function event_say(e)
	if(e.message:findi("letter back to him")) then
		e.other:SummonItem(8970); -- Letter to Jeremy
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 8969})) then -- Letter to Elishia
		e.self:Say("Oh, a letter from my grandson? Thank you very much. I haven't been able to talk to him recently. Would you mind taking a [letter back to him] for me?");
		e.other:Ding();
		e.other:Faction(275,10,0);  -- Keepers of the Art
		e.other:Faction(279,10,0);  -- King Tearis Thex
		e.other:Faction(246,10,0);   -- Faydarks Champions
		e.other:Faction(239,-10,0); -- The Dead
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- Elishia_Leafrunner
