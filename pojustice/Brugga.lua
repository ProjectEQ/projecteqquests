----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Brugga (201364)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 19 and e.other:GetLanguageSkill(19) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Orcish, 'Ragh!'  His eyes you with pure hatred.  'Indigo, my dark bowels...   treachery it is, treachery against the clan.  Gharol paid!  Paid for it!'  He shows you his hands and grins maliciously.  'Paid, he did!");
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