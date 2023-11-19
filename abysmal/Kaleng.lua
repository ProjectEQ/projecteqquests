function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("You looking for protection?  I gots da best.  Hard shell for soft ".. e.other:GetRaceName() .." body.");
	end
end

function event_signal(e)
	if e.signal == 1 then
        e.self:Emote("laughs loudly.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end