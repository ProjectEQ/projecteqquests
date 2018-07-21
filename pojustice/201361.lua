----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Jegard Q`Nacat (201361)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("opens his mouth and utters a sound as if two slates were grinding across one another.  He creaks his huge, stone wings and settles back into his motionless crouch.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end