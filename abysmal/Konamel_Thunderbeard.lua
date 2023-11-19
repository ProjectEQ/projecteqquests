function event_say(e)
    e.self:Say("Where's me ale?!  I cannot sail without me ale!  Hey that rhymed methinks!'  Konamel begins to sing an old sea chantey.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end