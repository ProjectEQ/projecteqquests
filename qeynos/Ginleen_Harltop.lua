function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail!  Keep all combat to the center of the ring. So says [Ebon Strongbear].");
	elseif(e.message:findi("ebon strongbear")) then
		e.self:Say("Ebon Strongbear is the current champion of the Steel Warriors. As champion, he rules over the Steel Warriors.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:qeynos  ID:1144 -- Ginleen_Harltop