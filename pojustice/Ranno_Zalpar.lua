----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Ranno Zalpar (201373)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("fingers the hilt of a blade that sticks out from the scabbard at his side.  'By the Allfather, this foolishness had best end soon.  The likes of me, trapped here like a songbird in a cage...   me, the most honourable soul across the whole continent of Farfurlong.  Loyal, dependable...'  He looks directly into your eyes.  'Honest.'  He sighs, and turns away.");
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