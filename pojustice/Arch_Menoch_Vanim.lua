----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Arch Menoch Vanim (201323)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("looks at you with an expression of smug satisfaction.  'What weak fools, those of the shortlings.  So willing to believe...  so ready to accept and to trust...'  He barks a hearty laugh.  'My experiments!  I must be permitted to return!  Without me to constrain them...'  His eyes take on a distant appearance.  'Perhaps, even without me, my trusty servants will continue my... work.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end