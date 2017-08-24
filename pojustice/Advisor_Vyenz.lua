----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Advisor Vyenz (201389)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Message(0,"The dark touches you, touches you.  Your soul, touched by Dark Clouds, Mythsong.  Dark Clouds.  The Master will have you yet, yet will you be had.  Open your eyes, ".. e.other:GetName() .. ".  Open your eyes and look deep into my gaze.  Repeat after me, after me...  'Advisor, my will is thine'");
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