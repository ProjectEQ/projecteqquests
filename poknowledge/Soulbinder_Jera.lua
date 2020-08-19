-- generic soulbinder quest
function event_say(e)  
	local soulbinder_lib = require("soulbinder");
	soulbinder_lib.say(e);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_spawn(e)
        local x = e.self:GetX();
        local y = e.self:GetY();
        eq.set_proximity(x - 90,x + 90,y - 90,y + 90);
end

function event_enter(e)
        eq.signal(202273,5); -- Qadar
end

