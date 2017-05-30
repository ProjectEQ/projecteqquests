function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("lirprin sent me") and qglobals["Fatestealer"] == "3") then
		eq.set_global("rogue_epic_keetra","1",5,"F");
		e.other:Message(15,"You have confirmed Keetra's innocence.");
		--e.self:Say("");  no idea what this text should be
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end