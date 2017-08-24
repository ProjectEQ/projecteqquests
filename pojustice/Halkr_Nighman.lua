----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Halkr Nighman (201218)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("Bah!'  He stirs, and looks up.  'Dark are these places.  Gods, the screams when they come.  When they don't, the endless wailing.  The sobs of some damned ogre I hear, keeping me awake, more often than not.  Some half-crazed 'Freeti yelling out obscenities.  Sometimes I even catch sight of a spirit.  Do you [" .. eq.say_link("believe in ghosts") .. "]?");
    elseif(e.message:findi("believe in ghosts")) then
        e.self:Say("I didn't believe in them, before I ended up here.  Funny how things end, when all's said and done.");
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