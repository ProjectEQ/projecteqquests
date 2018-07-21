----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Librarian Rushal (201226)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 18 and e.other:GetLanguageSkill(18) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Lizardman, 'A " .. e.other:Race() .. ", what a pleasant ssssurprise.  Here, of all placesss.  I wonder of which crime you are accusssed to bring you here, to the plane that watches all [planes]?");
        elseif(e.message:findi("planes")) then
            e.self:Say("in Lizardman, 'In thisss regard, you are talking to the expert, should such a thing exist.  I have been lauded as the authority on such mattersss.  I am not a walker of the planes, merely a ssstudent of them, but there is much one can learn should accessss to the relevant [resources] become posssible.");
        elseif(e.message:findi("resources")) then
            e.self:Say("in Lizardman, 'Long yearsss did I ssserve.  My cruel massster, Ral'Zehta the Knowing, kept me as a slave.  Dark, was Chelsith.  From within its walls, the cries of my kind rang throughout night and throughout day.  I consider myssself lucky, for my massster was the Proctor of the Great Library.  Such a collection of knowledge hasss never been heard of, I assure you.  Hall upon hall upon hall of collected ssscrolls, tomes, grimoires, and works of the cabalist arts.  I was one of his prized ssslaves, such as my race were to the Green-Scaled Ones.  Mine was a special [talent].");
        elseif(e.message:findi("talent")) then
            e.self:Say("in Lizardman, 'My kind are not known for their natural erudition, but I was blesssed by The Fearsome Himssself with the ability to learn, and learn quickly.  I sssoon learned the tongue of the Green-Scaled Ones, and many more besides from other ssslaves taken captive in the many conquessssts of the Green-Scales.  This came to my massster's attention, and it pleased him.  Pleased him as a particularly intelligent pet would please someone, I believe.  He put me to [work].");
        elseif(e.message:findi("work")) then
            e.self:Say("in Lizardman, 'As hisss prized ssslave, I was given the task of filing, cataloguing and sorting in the immense and endlessss halls, galleries and corridors of the Great Library, asssisting my master in his daily dutiesss.  I slept in the library at nights, but my nourishment was the [knowledge] contained therein.");
        elseif(e.message:findi("knowledge")) then
            e.self:Say("in Lizardman, 'The Green-Scales were travelers, and plunderersss.  They bargained with the gods themselvesss, made pacts and broke them.  The treasures that they amassed, the things that no mortal of our plane was meant to ssssee...   they coveted, and fought for, and hoarded.  The knowledge that they gained... that was the real treasure, but they valued it little compared to shining and glittering booty that they could lay their foul hands upon.  Much of that knowledge made itsss way into the Great Library.  Much of that was learned by me.  I fed my [passion].");
        elseif(e.message:findi("passion")) then
            e.self:Say("in Lizardman, 'The knowledge of the planesss, of course.  Those dimensions that run aligned with our own, and touch it, and each other, from place to place.  Like skinsss on an onion, an onion that one could peel forever and ever.  I can tell you about [this place], should you care to hear it.");
        elseif(e.message:findi("this place")) then
            e.self:Say("in Lizardman, 'According to the booksss that I had accesss to, this place is the embodiment of order within the universe.  Ever sssince the first mote of ordering of existence, springing out of the chaosss, so too did the Plane of Jussstice exist, to serve and judge the ordering.  It issss said in the Great Books that it shall remain until the end of Order itssself, until everything once again is anarchy.  Until then, there are the [Judges].");
        elseif(e.message:findi("Judges")) then
            e.self:Say("Lizardman, 'The six Judges rule thisss place, six and one more it is written.  Those accusssed of the mossst serious of crimesss are banished to this realm, their Court, for Trial by the Judges of all Judgesss, the Tribunal.  It isss written that their jussstice is impartial, and absssolute.  The innocent are returned to their place of origin, and their guilty meet the Executioner.  The judges deliver the fairessst [Justice] of them all.");
        elseif(e.message:findi("Justice")) then
            e.self:Say("in Lizardman, 'The Great Bookssss were vague on thisss point, but it seemed that each of the accusssed, in order for justice to be total, is here judged according to the lawsss of their own sssociety.  From the handsss of their own flesh and blood come the lawsss, and it is to these that they are held accountable.  Jussstice for me may be very different to justice for you, ".. e.other:GetName() .. ", but we are both served fairly.  As for my [crime], I am guilty already and confesssed.");
        elseif(e.message:findi("crime")) then
            e.self:Say("in Lizardman, 'I am a traitor.  When the planning for revolution came, inssstead of pledging my arms to those that would overthrow the Green-Scalesss, I could not leave my massster.  More, I could not turn from the Great Library because, for me, it was the reason for living itssself.  Were I to live ten thousand livesss, I could never read every book held within itsss endlesss walls.  Sssso, the flesh of my brothersss I denied in exchange for my thirssst for pure knowledge.  Ssssometimes, one must stand for one's beliefs, and I have remained true to myssself, if not to my fellowsss.  The law may find me guilty, but my heart issss innocent, ".. e.other:GetName() .. "; mark you well.  When The Green came, by brethren sent me here, and here I wait.");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end