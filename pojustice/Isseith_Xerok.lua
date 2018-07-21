----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Isseith Xerok (201313)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("glides towards you.  'The Arch Priest will have words, mark me.  Words!  Such injustice cannot be permitted!  I was sent here expecting fair trial!  Fair!  Not meeting an untimely end at the hands of some wretched human!  I demand to stand trial!  Demand!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end