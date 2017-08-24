----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Dumann the Quick (201210)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Ye rancid fool!  What kind of imbecile do ye think me to be?  Justice!  Hah!'  A distant look crosses his face.  'There ain't no such thing as justice.  'Specially not for the likes of me.  They say ye time comes - well our time came!");
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