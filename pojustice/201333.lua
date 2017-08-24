----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Archpriest Del`Maque (201333)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 17 and e.other:GetLanguageSkill(17) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Elder Teir'Dal, 'Hmmm.'  He motions to his two followers to be still.  'This one will not trouble us, I think.'  He turns to face you.  The years have not been kind to his ancient face, but his age does not bring weakness.  He eyes you with a fierce gaze.  'From the expression on its face, it doesn't even seem to [understand] what I'm saying.");
        elseif(e.message:findi("understand")) then
            e.self:Say("in Elder Teir'Dal, 'What!'  He grins a malicious smile, his yellowing tongue flicking out across his teeth.  'Perhaps ye're not so ignorant, after all.  What brings ye here?  'Tis usually only the damned guards that I see, bringing me that vermin-feed that they call nourishment.  Even the [Mistress] provided better than this.");
        elseif(e.message:findi("Mistress")) then
            e.self:Say("in Elder Teir'Dal, 'Fool...'  He sniggers to himself.  'Well, that's what she called herself, the silly wench.  Trying to build herself a little city of her own, what arrogance...'  From the folds of his thick robes, he reveals a small crystal sphere.  'Nothing that the [eyes] of Del`Maque cannot see, ye ken.'");
        elseif(e.message:findi("eyes")) then
            e.self:Say("in Elder Teir'Dal, 'The eyes of the dead are everywhere, and with the correct devices and words...'  He passes his hand over the sphere and clouds appear within, as if a fog had suddenly awoken.  He looks at you with ancient, lidded eyes that glitter with amusement.  'Try to set up her own little city...  right in the mountains, so she did.  All the terrain of the Lavastorm Mountains itself couldn't halt the advance of the angry King.  I wonder how the King [found out]...'");
        elseif(e.message:findi("found out")) then
            e.self:Say("in Elder Teir'Dal, 'Guess!'  He grins.  'How do ye think?  'Tis a foolish woman indeed that trusts the heart of Del`Maque.  I do hope that her downfall was not too... crushing.'  He laughs quietly.  'Of course, treachery to a witch is strictly against the letter of the law, ye ken.  I don't doubt that any reasonable judge with absolve me of all guilt.  If thy witch is a traitor, how else can ye act?'  He replaces the sphere within his robes.  'Poor, dearest, Najena...");
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