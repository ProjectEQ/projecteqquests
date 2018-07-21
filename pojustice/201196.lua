----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Trazin_D`Feyl (201196)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 4 and e.other:GetLanguageSkill(4) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Dark Elvish, 'Hail, ".. e.other:GetName() .. ".  These are momentous times.  You stand before a [martyr]!");
        elseif(e.message:findi("martyr")) then
            e.self:Say("in Dark Elvish, 'I shall give myself for the glory of the Dark Prince!  In my death, he shall take me in his arms and welcome me as one of his faithful, one of his true faithful!  Unlike the blasphemous fools that would send me here, to an eternity of waiting!  In his name was the [pact] so forged!");
        elseif(e.message:findi("pact")) then
            e.self:Say("in Dark Elvish, 'So it is.'  He grins.  'The gates of the far temple, did I oversee.  In distant Kiera'loal, and to the [General] did I pledge allegiance, in the name of the Dark Prince!'  His eyes roll, and you wonder how long he has been insane.  'Allegiance!");
        elseif(e.message:findi("General")) then
            e.self:Say("in Dark Elvish, 'Walker of worlds, is he.  Burner of the Gods themselves, victor in battles uncounted, spreading the work of my Dark Regent without even knowing it!  Vhan`Geltah has seen more than I can ever dream, and by his side, I would have seen yet more!  More!  In my death, I shall be redeemed, for my Lord knows the truth of my soul, and it is with him that my true Judgment shall stand.");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end