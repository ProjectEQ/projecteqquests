function event_spawn(e)
	eq.set_timer("appearance", 1000);
end

function event_timer(e)
	eq.stop_timer("appearance");
	e.self:SetAppearance(3);
end

function event_say(e)
    if e.message:findi("Hail") then
        e.self:Emote("lies shivering and wheezing as her body withers.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end