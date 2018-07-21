----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Al`Corisalm (201419)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 11 and e.other:GetLanguageSkill(11) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Old Erudian, 'Hah!'  He chuckles, a disembodied and deep laugh that sounds as if it comes from the cell-floor itself.  '" .. e.other:Race() .. "!  Such a delight to see one other than Steldenn.  Have you [escaped] this place?");
        elseif(e.message:findi("escaped")) then
            e.self:Say("in Old Erudian, 'My plans for escape are detailed.  I but await the perfect moment, that golden opportunity, that ray of light that shines but once in forever.  If nothing else, I have time to make plans!  Such plans, worthy of the Great Al`Corisalm!  I imagine that you are anxious for me to [tell] you of such things.'  You feel a warmth on your face, as if the figure has come particularly close.");
        elseif(e.message:findi("tell")) then
            e.self:Say("in Old Erudian, 'I shall!'  He laughs and you hear the clap of hands.  'Of course!  Before I was brought to this place, I was an... Advisor, of sorts.  The Great Al`Corisalm, renowned traveler, collector, theologian and revered sorcerer of Erud.  He was a wise one, Erud.  To take on my counsel and to listen as raptly to my sage advice as you do now... a rare wisdom did he possess.  Whether in war, or in peace, his ear was my captive audience.  Such an [audience], ah me...");
        elseif(e.message:findi("audience")) then
            e.self:Say("in Old Erudian, 'Can the sun be held responsible for its warmth, with which it nurtures the crops and brings life unto the world?  Can the mountains be held accountable for being strong, the bones of the earth?  Of course they cannot, it is but their nature.  So it is with my wisdom.  The Great Al`Corisalm is wise, as the sun is warm, as the mountains are sturdy.  All the more painful is my [plight], as you might well imagine.");
        elseif(e.message:findi("plight")) then
            e.self:Say("in Old Erudian, 'Being a master of the refined arts, my conclusions are based on facts.  A pure fact, perfect and true, is an atomic quantity of beauty itself.  I once said that on a speech to the Low Men, across the Wide Sea.  All of my advice, for good or ill, can only be based on the data which I collect.  The veracity of such information is subject only to those that procure it, I am sure that you [agree].");
        elseif(e.message:findi("agree")) then
            e.self:Say("in Old Erudian, 'There are those that sought to bring Erud low.  In his time of greatest struggle, he fought with the ignorant, the clumsy, and the bereft of wisdom.  It is in this time that he came to me with a question, a decision so momentous that he could not act without first consulting the Great Al'Corisalm.  His construction of his new city was to be a testament to the pure wisdom of our kind, and of course required very particular and precise requirements for the [location] of its foundation.");
        elseif(e.message:findi("location")) then
            e.self:Say("in Old Erudian, 'Ahh..'  He coughs, and a moment of silence passes.  You feel the chill air of the surroundings, as you try to pin-point the location of the disembodied voice which then resumes.  'Erud's new city needed magical channels, certain qualities of the natural bedrock which conveyed that power innate to the earth itself.  It is this power that I proposed to harness in order to drive our new inventions: our water purification systems, our transport systems, all manner of civic advances that would make the new city a beacon of civility in the midst of the Low Men.  So, I sought data from those whom know the [natural powers] so well.");
        elseif(e.message:findi("natural powers")) then
            e.self:Say("in Old Erudian, 'Geomancers are they, to us.  Druids are they, to the Low Men.  Yet, I was tricked.  Those that would have brought Erud low placed an agent in the forests, posing as a geomancer.  To compound treachery upon treachery it was my turn-coat friend, Shadalis, that led me to believe this geomancer was to be trusted.  With innocent motivation, I collected the necessary information from this agent of the Dark Ones.  Believing it, trusting my friend Shadalis, I used the geomancer's advice to advise Erud.  It proved to be my [undoing].");
        elseif(e.message:findi("undoing")) then
            e.self:Say("in Old Erudian, 'To live a life according to the tenets of wisdom, to insist upon rational proof throughout one's entire existence, and then to throw it all away by believing a traitor that one took to be a friend...   it is something for which the Great Al`Corisalm will carry in his heart forever.  Erud began construction of his city based upon my flawed advice and, soon enough, the evidence of the Dark Ones' trickery became obvious.  The powers of the earth that we sought to harness turned against us, causing anarchy, [chaos].");
        elseif(e.message:findi("chaos")) then
            e.self:Say("in Old Erudian, 'Such events are not for me to describe to you, there are some things best left untold.  When the final dust settled upon the earth, it was to me that Erud came.  To me that he apportioned responsibility.  He turned me over to the judges of the Low Men.  They banished my form to the ether, and in turn passed on my spirit here, to the Tribunal, to be judged.  It is here that I await trial at the hands of the Judges Which Have Always Been.  That is, unless I escape...'  The voice trails off into silence.  A shiver passes through you.");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end