----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Wurgoz (201337)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("tilts his head and gives a slight twitch of his eyes in quick observation of ".. e.other:GetName() .. ", 'You are free...  you are not a prisoner of this place. Interesting. Perhaps...  perhaps you would care to listen to my tale? Maybe... maybe you can give me some relief from this suffering and ease my conscience if only for a moment.");
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