----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Captain Nyra (201350)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("glares coldly upon ".. e.other:GetName() .. ", a seemingly deadened emotion of hate briefly resurrected in her gaze, 'Move along, traveler. We are nothing for your interests -- merely prisoners. Stay and observe us if you will -- perhaps one day, you will join us.");
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