function event_combat(e)
    if (e.joined == true) then
        eq.set_timer("start_attrition", 5000);
        eq.set_timer("start_feedback", 6000);
        eq.set_timer("start_discord", 10000);
    else
        eq.stop_all_timers();
    end
end

function event_timer(e)
    if (e.timer == "start_attrition") then
        e.self:CastSpell(4749, e.self:GetID())
        eq.stop_timer(e.timer);
        eq.set_timer("attrition", 60000);
    elseif (e.timer == "start_feedback") then
        e.self:CastSpell(4748, e.self:GetID())
        eq.stop_timer(e.timer);
        eq.set_timer("feedback", 45000);
    elseif (e.timer == "start_discord") then
        e.self:CastSpell(5554, e.self:GetID())
        eq.stop_timer(e.timer);
        eq.set_timer("discord", 90000);
    elseif (e.timer == "attrition") then
        e.self:CastSpell(4749, e.self:GetID())
    elseif (e.timer == "feedback") then
        e.self:CastSpell(4748, e.self:GetID())
    elseif (e.timer == "discord") then
        e.self:CastSpell(5554, e.self:GetID())
    end
end

