----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Moobik (201297)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 7 and e.other:GetLanguageSkill(7) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Ogre, 'Vengeance!'  He bellows and looks about as if he has misplaced his weapon.  'The Avatar of my God fell to my axe, and you shall be next!  There are no Gods, only victors in battle!'");
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