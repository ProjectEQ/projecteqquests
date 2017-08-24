----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Genni Dulzane (201410)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("turns her face to you; the expression is one of compassion.  'Hail to thee, ".. e.other:GetName() .. ".  'Tis a fearful dread that ye carry, fearful indeed.  I am not fearful any more.  In death, one learns tranquility.  Did not the old ones of Quellious always put it so?  Let me stay your fears; wouldst ye [" .. eq.say_link("talk a while") .. "]?");
    elseif(e.message:findi("talk a while")) then
        e.self:Say("It is well, the librarians used to say that we were to learn from history.  Learn well!'  She chuckles, the laugh a hollow sound carried away on the chill breeze.  'Together, we three were brought to this place.  Much like the others here, we were innocent all three.  Is not every one of us innocent, even in crime?  Ours is a Fate [" .. eq.say_link("cheated") .. "], though.");
    elseif(e.message:findi("cheated")) then
        e.self:Say("Aye, cheated, but in tranquility even the affairs of men mean naught, know ye that.  Waiting in Judgment, waiting for the Law Absolute, we were.  Waiting here...'  She waves her hand at the surroundings, and you detect a barely audible sigh escape her lips.  'Waiting and waiting.  To eternal imprisonment we were resigned, for our [" .. eq.say_link("crimes") .. "].  All three of us, our merry band of seekers.  In life, we were petulant, eager.");
    elseif(e.message:findi("crimes")) then
        e.self:Say("Our crimes are of the flesh.  Foolish, young, and to be paid for.  They are of little consequence now.  Much as everything, ye might say.  Little expected, our judgment was to be more swift than we had a right to expect, and from [" .. eq.say_link("improper hands") .. "].");
    elseif(e.message:findi("improper hands")) then
        e.self:Emote("dims slightly, then returns to sight.  'Improper indeed, for the door was burst open, and armed!  Armed he was!  Terrible and vicious, with anger and hatred - no justice, no judgment, unless 'twas the judgment of a [" .. eq.say_link("mortal") .. "]!'");
    elseif(e.message:findi("mortal")) then
        e.self:Say("Who can say?  There are forces at work within this judiciary that are not those of the Tribunal, I am certain.  We must forgive the transgressions of the mortal; they shall reach their tranquility in time.");
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