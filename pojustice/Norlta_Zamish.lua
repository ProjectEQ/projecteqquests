----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Norlta Zamish (201416)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Hmm, is someone there?  I've been [" .. eq.say_link("wrongfully imprisoned") .. "] I'm waiting for appeal, but its been a long time.  Where, in the name of Brell, is my appeal?");
    elseif(e.message:findi("wrongfully imprisoned")) then
        e.self:Say("They have me here for a little [" .. eq.say_link("white lie") .. "], how can that be justice?  What is this, the Plane of Injustice? The Plane of Unfarity?");
    elseif(e.message:findi("white lie")) then
        e.self:Emote("blushes. 'Well maybe a little more than a little white lie, but I still don't deserve to be here with murderers and crazy people, and the like.  You look like a fair person, why don't you tell me if you think I should be here? Want to [" .. eq.say_link("know what happened") .. "]?");
    elseif(e.message:findi("know what happened")) then
        e.self:Say("I was an apprentice for Varkon Theardor in Ak'Anon, and he sent me to scout the minotaur caves, to make sure the hero wasn't out and about.  Well I made it out to Steamfont, and it was one of the most beautiful days I'd ever seen, halfway to the caves I set down to watch some clouds go by.  Next thing I know it was hours later, I didn't rightly have time to make it to the caves and back, so I went to [" .. eq.say_link("Varkon") .. "] and told him the hero wasn't around.");
    elseif(e.message:findi("Varkon")) then
        e.self:Say("Well little did I know, Varkon was planning a trip to the caves, I guess I should have figured it, but I just wasn't thinking.  Hours passed, until finally word came that the minotaur hero had squished poor Varkon.  When news reached Larkon, Varkon's brother, that I was responsible for Varkon's death he asked that I be set before the Tribunal.");
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