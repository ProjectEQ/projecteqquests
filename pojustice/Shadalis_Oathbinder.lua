----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Shadalis Oathbinder (201332)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("does not look up from his hands.  He opens and closes his right fist, as if contemplating a battle within his thoughts.  'What?  What!  Speak ye, I have no tolerance of the wretched sorts such as yourself.  Mine is [" .. eq.say_link("torment") .. "].");
    elseif(e.message:findi("torment")) then
        e.self:Say("Torment!  That's right!'  He jumps to his feet and rushes at you with murder in his eyes.  Raising his arm as if to strike you, a look of resignation crosses his face.  'Bah, you are not worth my time.  Begone, lowling.  Begone lest I take you with me when I am judged.'");
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