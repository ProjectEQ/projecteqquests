----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Numeinastel (201384)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 12 and e.other:GetLanguageSkill(12) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Elder Elvish, 'By the Gods, get out of sight!  Should the guard see you, or maybe worse, Steldenn himself, you might well find yourself haunting these walls forevermore!  Hide yourself, in this [form] I cannot aid you!");
        elseif(e.message:findi("form")) then
            e.self:Say("in Elder Elvish, 'Unless of course you like excessive quantities of fur and a somewhat unpleasant odor.  Those abound, more's the pity, as well you might see.  I ask you, which is worse: [temptation] into crime or merely [getting caught] in the act?");
        elseif(e.message:findi("temptation")) then
            e.self:Say("in Elder Elvish, 'It's like I always say, be as bad as you like but make sure that no one is watching!  Especially if the one that is watching happens to be the Lord High Emperor.'  He wrinkles a rather gummy snout in distaste and flicks one of his ears.  'How was I to know?  If a man leaves his [chamber] unlocked, then what more is to be expected than a few welcome guests?");
        elseif(e.message:findi("chamber")) then
            e.self:Say("in Elder Elvish, 'Carandril has everything.  His Imperial Army maintain his lands across the Faydark, his rule is virtually unchallenged, his people prosper and he has more wives than there are days of the week!'  A gruff sound escapes his ursine throat which you assume to be laughter.  'In me, he had a trusted [friend]!'");
        elseif(e.message:findi("friend")) then
            e.self:Say("in Elder Elvish, 'Well, maybe I wasn't quite his friend, but a gentleman's butler is second only to his best companion, so they say.  So I was!  Off on one of his many hunts, he was.  Forbidden to the enter that chamber, I may have been, but that light...  that golden light!'  His snout is close to your face now, and a breath carrying the foul odor of putrid meat causes your eyes to water.  'I had to look.  What a [sight].");
        elseif(e.message:findi("sight")) then
            e.self:Say("in Elder Elvish, 'On his last 'crusade', it appears that the dear Emperor took his best spoil yet, the living soul of a [Dreamspinner]!");
        elseif(e.message:findi("Dreamspinner")) then
            e.self:Say("in Elder Elvish, 'Oh come now, don't play the ignorant one.  Who hasn't heard of the Dreamspinners, that can see directly into the mind, even those of we Tunare's Children?  Carandril somehow had the living essence of such a creature, separated from its hideous form and kept in captivity within a sealed jar in his inner chamber!  Remarkable.  You'll know of the [legend], of course.");
        elseif(e.message:findi("legend")) then
            e.self:Say("in Elder Elvish, 'Aye!  The legend!  The Dreamspinners consider it the most unspeakable crime amongst their kind to allow themselves to be taken into captivity, so the old myths go.  Should such an unthinkable event ever occur, the spirit of that poor damned Dreamspinner is rendered up to the Justice of the [Six].");
        elseif(e.message:findi("Six")) then
            e.self:Say("in Elder Elvish, 'The Judges of all Judges!  The Six!  It is they that mete out the final judgments upon we mortals.  Even the spirit of poor Xenioth.  His only crime was to be seized by the grasping clutches of our dear Emperor!'  That throaty sound of amusement escapes him once more, and another wave of putrid breath assails your nostrils.  I [talked] with him some, you know.");
        elseif(e.message:findi("talked")) then
            e.self:Say("in Elder Elvish, 'Well, I say talked.  It's hard to hold a conversation with a disembodied spirit.  The Dreamspinners have that special way of getting into your thoughts, so they do.  We chatted quite comfortably for nearly an hour inside my head, to and fro, back and forth.  It seems that Carandril caught him off-guard, and his sorcerers stripped his form from his spirit, sealing him into the jar in which I found him.  I suppose that busybody Edril put him up to it.  Well, I couldn't resist.  I set him [free].");
        elseif(e.message:findi("free")) then
            e.self:Say("in Elder Elvish, 'So I did!  Smashed the jar upon the boards of the floor, and Xenioth was free!  I was always the one that bought the caged birds at the market, just for the purpose of setting them free.  Life is too beautiful to spend it caged, they always say.  I heard his voice in my thoughts one last time before his spirit vanished, so I did: 'The Endless thanks you'.  Thanks indeed!  I only hope he isn't caught for his crime.  I wish that I could say the same for myself, you can see my [fate] with your own eyes.");
        elseif(e.message:findi("fate")) then
            e.self:Say("in Elder Elvish, 'Our noble Emperor caught me with the jar smashed at my feet and a look of shame upon my face.  I'm not a coward, mind you; I came clean.  Much good as it did me.'  A small quantity of drool escapes his maw.  'He used his Tunarean glamors to trap me in this cursed form you see before you.  So high and mighty, his time will come!  Here I am, at least, in a place that's slightly more fair.  At least here I can look forward to actual justice...'  He turns and gives you a view of his ample posterior.  You realise that the conversation is at an end.");
        elseif(e.message:findi("getting caught")) then
            e.self:Say("in Elder Elvish, 'It's like I always say, be as bad as you like but make sure that no one is watching!  Especially if the one that is watching happens to be the Lord High Emperor.'  He wrinkles a rather gummy snout in distaste and flicks one of his ears.  'How was I to know?  If a man leaves his [chamber] unlocked, then what more is to be expected than a few welcome guests?");
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