function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("mumbles about some calculations, counting on her fingers. 'I keep going over it in my head. The numbers all add up, but I'm still amazed this ship floats!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end