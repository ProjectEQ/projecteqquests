function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello. Just arrived? My husband and I recently arrived as well.  We hope to aid the brotherhood as much as possible.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end