----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Umplud (201397)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("jumps over to you and throws his arms around your knees.  Burying his head against your thigh, he begins to sob profusely.  His tears begin to wet your leg.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end