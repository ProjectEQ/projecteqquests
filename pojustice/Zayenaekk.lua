----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Zayenaekk (201281)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("flaps her wings and raises her chin high and proud as she gazes down upon ".. e.other:GetName() .. ", 'You stand before Zayenaekk -- servant of Murdunk and prisoner now of the Tribunal. It has been many years since our paths last crossed, " .. e.other:Race() .. ", but there is nothing more to this being than the formerly stated. Move along, ".. e.other:GetName() .. ". This is not a realm for the free to wander.");
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