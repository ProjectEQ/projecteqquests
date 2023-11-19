function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("The discovery of the lost dungeons was great, but I believe us finding this new continent will be even greater.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end