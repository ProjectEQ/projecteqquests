----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Royal_Guardian_Finro (201415)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 12 and e.other:GetLanguageSkill(12) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Elder Elvish, 'Leave me be, whoever you are.  The time for words is passed...");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end