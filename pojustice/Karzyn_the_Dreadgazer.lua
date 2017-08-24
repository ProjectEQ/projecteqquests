----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Summoner Teikk (201222)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Message(5,"".. e.other:GetName() .. ".  Come closer, closer.  Ever closer.  Look at me, let me gaze upon you, upon you.  Many things I see, I see, many things.  I have [" .. eq.say_link("seen") .. "] much since coming here.");
    elseif(e.message:findi("seen")) then
        e.self:Message(5,"This place is supposed to be the true Justice, the embodiment of Order itself.  Yet, there are [" .. eq.say_link("forces") .. "] working within this place, forces not working in accord with the Judges.");
    elseif(e.message:findi("forces")) then
        e.self:Message(5,"I have seen much, seen much.  Jacosh is the Warden here.  It is his task to carry out the work that the Judges pronounce it is.  Pronounce they, impartial they, judging each to his own, they.  Each to his own.  Jacosh is [" .. eq.say_link("different") .. "].");
    elseif(e.message:findi("different")) then
        e.self:Message(5,"He is not impartial, he is but mortal, mortal.  Some judgments of the High Judges, though impartial and fair for the kin of the accused, seem less fair to the mortal eyes of [" .. eq.say_link("Jacosh") .. "].");
    elseif(e.message:findi("Jacosh")) then
        e.self:Message(5,"He is short-sighted, short-sighted.  He makes his own [" .. eq.say_link("judgments") .. "].");
    elseif(e.message:findi("judgments")) then
        e.self:Message(5,"His own judgments, and often they do not agree with the Judges.  Sometimes it seems to him that a prisoner is judged too harshly.  These he sometimes helps escape, escape.  Not the [" .. eq.say_link("others") .. "].");
    elseif(e.message:findi("others")) then
        e.self:Message(5,"Sometimes it seems to him that a prisoner is judged too lightly.  With these, the prison walls ring with their screams as torture is performed.  So far, he is undetected by the Judges.  I see much.  I see... so much, so much...");
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