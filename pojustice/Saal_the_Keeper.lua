----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Saal the Keeper (201268)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("turns his back on you, and chirps quietly.  His tail flicks back and forth and you begin to wonder what could have caused such a foul stench as just now assails your senses.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    e.self:Emote("cries out, 'Guards!  Guards!");
end

function event_death_complete(e)
    e.self:Say('Justice comes to all, in time.');
end