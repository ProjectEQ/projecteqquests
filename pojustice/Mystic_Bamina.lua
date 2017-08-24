----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Mystic Bamina (201372)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Help me!  Help, please!  I do not belong here!  Mine is but a task of innocence!  Sent to trap he of the Darkwater, not to share in his Fate!   Surely you can see that!  Surely the blood that is upon his hands has not stained my own destiny!  Help me, get word to my people!");
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