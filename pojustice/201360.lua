----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Zammar of Tial`Vok (201360)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("")) then -- Anything said
        e.self:Emote("glares at you and does not respond.");
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