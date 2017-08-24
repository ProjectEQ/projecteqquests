----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Alchemist Jorrum (201405)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("holds his head in his hands and lets out a cry of anguish.  'By the High Ones!  Make it stop!  Get it out of my mind!  Ever since I arrived, it has been [" .. eq.say_link("invading") .. "] me!'");
    elseif(e.message:findi("invading")) then
        e.self:Say("There is something at work in this place, something that is able to sift through my thoughts as if they were parchments in a tome!  Help me, you must help me!  I pray endlessly to The Fearsome, praying for an end to the torment!  I can get no sleep, it seems even stronger in my [" .. eq.say_link("dreams") .. "]!");
    elseif(e.message:findi("dreams")) then
        e.self:Emote("nods and continues to moan in agony.  'The others here say that it is something they call The Dream Thief, burrowing deep into my mind, trying to find a place to escape, to transfer itself...'  His eyes roll back into his head.  'Help me, please!  It hurts so much!  It hurts so much!'");
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