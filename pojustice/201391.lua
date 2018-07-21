----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Georr Kul`Daar (201391)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 14 and e.other:GetLanguageSkill(14) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Goblin, 'What in the Dark Stars is this that stands before Chief Georr of the Kul`Daar?  What strangeness, it walks on two legs like a jollytot...  all upright and flimsy-looking.'  Georr looks you up and down, taking you in with eyes that show a ruthless intelligence.  '[Ankexfen] maybe?");
        elseif(e.message:findi("Ankexfen")) then
            e.self:Say("in Goblin, 'Yes!  Yes!  I knew it was so, you fit the descriptions!'  He cackles gleefully, as if he has struck gold.  'Forbidden knowledge, it is...  blasted from our memories after The Scattering.  Some of us still remember, fragments!  Fragments, but when sewn together...'  He jumps up and down in excitement.  'So you are!  Worth being thrown here it is, to see that it is true!  TRUE!  So I knew it to be and have been proven!");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end