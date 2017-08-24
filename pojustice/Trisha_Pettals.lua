----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Trisha Pettals (201264)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 9 and e.other:GetLanguageSkill(9) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Halfling, 'Why!'  She sobs, and covers her face with her hands.  'Why did I listen to him?  Why?  What [foul misfortune] is this that has descended upon me?");
        elseif(e.message:findi("foul misfortune")) then
            e.self:Say("in Halfling, 'Such woeful days, of such infinite duration have I spent herein.  All because I took the advice of Vanim...  what evil tidings he brought.  What lies he spread, and what a susceptible fool am I for believing him...'  She redoubles her tears, and you can do little to bring her around.  'Dear Rainkeeper, why?");
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