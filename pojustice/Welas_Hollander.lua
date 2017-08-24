----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Welas Hollander (201326)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 11 and e.other:GetLanguageSkill(11) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Old Erudian, 'Unnnn...'  He fades and then rematerializes, as if talking is causing great effort.  'Hail to thee, ".. e.other:GetName() .. ".  Be careful!  Ware!  Careful who to trust in here, or ye'll find one day waking with a blade in your chest, as I did!  Watch ye!");
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