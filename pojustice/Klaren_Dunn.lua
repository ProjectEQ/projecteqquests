----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Klaren Dunn (201295)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 5 and e.other:GetLanguageSkill(5) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Dwarvish, 'Allfather's blessings to you, ".. e.other:GetName() .. ".  You dress mighty odd for a " .. e.other:Race() .. ", I must say.'  She regards you with great interest.  'A prayer to Surrilis himself for your health.  You look as if you're right bursting at the seams to talk, so you are.  Have you brought word from one of my friends?");
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