-- generic soulbinder quest
function event_say(e)  
	local soulbinder_lib = require("soulbinder");
	soulbinder_lib.say(e);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
