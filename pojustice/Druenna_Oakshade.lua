----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Druenna Oakshade (201308)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("sheathes the knife with which she was trimming her nails.  'Hail, there.  What is your business?  Have you been [" .. eq.say_link("") .. "], also?'");
    elseif(e.message:findi("set free")) then
        e.self:Emote("speaks in a bold voice.  'I saw it with my own eyes.  The little halfling boy, he was crying night and day.  The Warden walked up, bold as brass, and just let him free.  The myths speak of this as the domain of pure and cold justice...   where is the justice in the Warden taking affairs into his own hands?  By the Gods, he shall stand a trial of his own when I convey these events to whatever is in control here!'  She looks around and then speaks in a lower voice.  'Say, you wouldn't be able to help me escape, would you?'");
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