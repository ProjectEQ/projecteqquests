----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Kantao Darkwaters (201399)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Tricksy beast that you are, the Darkwaters shall have their revenge!  Mark my words, " .. e.other:Race() .. "!  The old ways are swept away, and we must join with the new powers if we are to survive!  A storm is coming to Farfurlong, and the wise will be on the side of the victors when the dust has settled!");
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