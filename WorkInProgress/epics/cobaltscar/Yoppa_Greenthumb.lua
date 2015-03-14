--cobaltscar/Yoppa_Greenthumb.lua NPCID 117088
--Shaman Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("elder spirit sent me") and qglobals["shaman_epic"] == "1") then
		e.self:Say("Huh? Oh. Me see you help. Poor spirit. Me hope it okay. Only saw few days ago and it seem sad and sick. We make it better! Me hope yous okay wit' breathin' under here. Me be waiting for dat pesky fish to come back wit' my bark dat I got down here. You can help. In fact, you do it. He big nasty shark and me tired. If you wait, he come back for more. It probably still sniff me blood from dat last bite he took. You keep and take to spirit . . . Look out, dere it is and it got friends!");
		eq.spawn2(117091,0,0,1048,343,-39,128) --Gnashing_Killer_Shark
		eq.spawn2(117089,0,0,1052,333,-39,128) --Darting_Shark
		eq.spawn2(117090,0,0,1054,330,-39,128) --Feeder_Shark
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	