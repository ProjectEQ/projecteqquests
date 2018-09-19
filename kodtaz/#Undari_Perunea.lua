--kodtaz/#Undari_Perunea.lua NPCID 293176
--Shaman Epic 2.0
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["shaman_epic"] == "9") then
		e.self:Say("Are you here to help me? Yes, I feel the intent of your spirit. You must be careful, the evil beast that stole my necklace is ever near.");
		eq.spawn2(293233,0,0,182.6,-661.5, -428.8,144); --Ikaav Spiritstealer
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
	
	
