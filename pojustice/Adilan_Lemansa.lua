----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Adilan Lemansa (201331)
----------------------------------------------------------------------

function event_say(e)
    e.self:Emote("glares at you and does not respond.");
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end