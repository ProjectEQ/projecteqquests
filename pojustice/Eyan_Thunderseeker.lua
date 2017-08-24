----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Eyan Thunderseeker (201229)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("turns to face you, his fingers running through his mane as he speaks hurriedly.  '" .. e.other:Race() .. ", well well.  Wonders may never cease.  What have you to say to Eyan, Seeker of Thunder?  Do you bring word of the [" .. eq.say_link("Rainkeeper") .. "]?");
    elseif(e.message:findi("Rainkeeper")) then
        e.self:Say("He that brings life to the plains, he that blesses us with the storms and floods that purify the land each year.  I am on a [" .. eq.say_link("quest") .. "], and am sure that my time here shall be brief so that I may continue with my work.");
    elseif(e.message:findi("quest")) then
        e.self:Say("My kin make their homes upon the Plains of the Rainkeeper; we live mainly in the temperate south, where we can feel the wind in our manes and where the gallops are open.  This last year has proved to be a year of suffering for my kind, the droughts have gripped the land and I have been tasked by the chieftains to discover why the Rainkeeper is displeased with us.  Why else would he withhold his life-bringing waters from our crops?  I returned to my village after journeying far, to seek the opinion of the Elder Naturewalkers.  I found [" .. eq.say_link("turmoil") .. "] when I arrived.");
    elseif(e.message:findi("turmoil")) then
        e.self:Say("The village soothsayer...  he lay dead.  They found an old hunting blade of mine covered in blood, and lying by his side.  The wounds were such that...  it could have only been done by someone attacking from behind.  According to village law, I am to stand trial for the crime.  However, my innocence is obvious to all, it cannot be otherwise.  I shall soon be through this trial, and back upon my quest.  Mark my words, ".. e.other:GetName() .. ".");
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