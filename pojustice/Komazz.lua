----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Komazz (201236)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 21 and e.other:GetLanguageSkill(21) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Dragon, 'Too late!'  He flicks his wings and rolls his eyes, bloodshot and with a look of desperation.  'The [mating]...  cannot be stopped by the likes of you, " .. e.other:Race() .. "!  It is far too late for intervention!");
        elseif(e.message:findi("mating")) then
            e.self:Say("in Dragon, 'The old ones, what little do they know.  What erudition they claim and yet how naive their studies...   true power shall be ours!  True power, even if it means defiance of the High Mother herself!  Tear the stars from the heavens, he will!  Take his place amongst the Gods themselves!");
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