----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Lasiya (201362)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 23 and e.other:GetLanguageSkill(23) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Dark Speech, '" .. e.other:Race() .. "...'  She tucks her long, beautiful hair behind her ears and meets your gaze.  In her eyes you see...  desire?  'The Dark Tower always has need for new...  blood.   Come closer, little " .. e.other:Race() .. ".  Lasiya won't hurt you, not a bit.  Come and lose yourself in my arms...   I can guarantee you an eternity from which you will never wish to escape...''");
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