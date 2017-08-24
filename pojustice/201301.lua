----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Maen Kul`Daar (201301)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 14 and e.other:GetLanguageSkill(14) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Goblin, 'Murder, burning, fear and fight - screaming pain your endless plight!'  He rubs his hands together anxiously and grins at you.  'Chief will set you right, he will.  All I do is protect him, but these walls make it hard!");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end