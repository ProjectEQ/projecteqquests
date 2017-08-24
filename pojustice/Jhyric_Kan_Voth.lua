----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Jhyric Kan Voth (201377)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 24 and e.other:GetLanguageSkill(24) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Vah Shir, 'Hail.'  Jhyric looks at you with stern eyes.  He seems to be deep in thought.  'What is your business here?  You walk with freedom around this [prison].");
        elseif(e.message:findi("Prison")) then
            e.self:Say("in Vah Shir, 'It is not for one of my kind to be sealed in a place such as this.  Since when has nobility been constrained?  Since when has honor been a virtue to put on trial and quantify with weights and measures?  The Taruun are beyond such affronts to our valor.  Ever since the time of the [Great Unification] have we been the eyes and ears of the Crown upon Norrath.");
        elseif(e.message:findi("great unification")) then
            e.self:Say("in Vah Shir, 'Your lack of knowledge of history belies your ignorance, ".. e.other:GetName() .. ".'  His eyes sparkle, and you notice that captivity has merely honed his spirit.  'Many centuries ago, the explorers came to our noble city.  [Explorers] from the cities of Norrath, they came in droves once their primitive minds discovered the workings of the Great Spires, following their Al'kabor.  Their kind trampled our crops with their clumsiness and eagerness to explore our lands.");
        elseif(e.message:findi("Explorers")) then
            e.self:Say("in Vah Shir, 'How they came, in droves no less...  like locusts, it is written.'  He wrinkles his small nose in disgust.  'All the races of the Below, appearing day after day after day at the Great Nexus, near to where the Fordels and the Midsts made their settlement.  Our King welcomed them with the nobility customary to my kind.  Some he even allowed to become honorary citizens.  History proved him wise.  In exchange for local commodities, those of the explorers upon which he bestowed citizenship took word back to the Below, to Norrath, to the leaders of Men, and of the Elves.  It was a time of [prosperity].");
        elseif(e.message:findi("prosperity")) then
            e.self:Say("in Vah Shir, 'Aye, the trade was welcome within the Great Walls.  Though primitive and in the thrall and worship of gods, certain trade-ways of the Norrathians proved to be extremely lucrative to the Kingdom.  The King was thrice-blessed for his foresight and dealings with the primitives, the history books tell us.  Your lack of knowledge surpasses your ugliness, you know.'  His ears lie flat against his head and his tail swishes violently.  'Surely you did not come here for a history lesson from a [veteran]?");
        elseif(e.message:findi("veteran")) then
            e.self:Say("in Vah Shir, 'I have seen more wars than you have had hot meals.'  A feline chuckle escapes him, despite his earnest expression.  'The wars when the Unification ended, the wars with the Dalh Shir, the endless wars with no names that we Taruun fight for Shar Vahl without it even knowing we fight.  Here I remain, trying to make sense of the words of fools, and wondering as to the [true nature] of my imprisonment.");
        elseif(e.message:findi("true nature")) then
            e.self:Say("in Vah Shir, 'I should have expected such things to escape your ignorant senses.  Time!  Can you not see?  Time itself stands still here, or so it seems.  I have gleaned much information from those bumbling fools that I can, here in this place.  Wherever I am, 'tis a time outside of times.  The poor fools here seem to come from...'  His eyes take on a nervous twitch.  'They seem to come from many different times.  I have spoken to Ancients, here.  And I have spoken to those from centuries which have not yet passed.  I cannot determine what [witchcraft] it is at work, but I shall find out, depend upon it.");
        elseif(e.message:findi("witchcraft")) then
            e.self:Say("in Vah Shir, 'What else could bind us all here, like cubs held by the scruff?  Surely you do not mean to tell me that you believe all this nonsense about justice.  What justice is there in a world that makes captives of noble souls such as myself?'  He growls, and evidently tires of you, turning away and muttering to himself.");
        end
    else
        e.self:Emote('does not appear to understand you.');
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