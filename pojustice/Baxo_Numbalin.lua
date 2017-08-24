----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Baxo Numbalin (201282)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("furrows his brow and sighs heavily, his grief and boredom more than apparent. The gnome looks up at you with deadened eyes and a veil of unfathomable sadness. He opens his mouth as if to speak, but remains silent and turns away, staring once more upon the unvarnished walls of his cell.");
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