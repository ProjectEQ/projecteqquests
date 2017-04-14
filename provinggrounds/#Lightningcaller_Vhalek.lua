function event_combat(e)
    if (e.joined == true) then
        eq.set_timer("start_touch", 2000);
        eq.set_timer("start_defiance", 3000);
    else
        eq.stop_all_timers();
    end
end

function event_timer(e)
    if (e.timer == "start_touch") then
        e.self:CastSpell(6189, e.self:GetID());
        eq.stop_timer(e.timer);
        eq.set_timer("touch", 45000);
    elseif (e.timer == "start_defiance") then
        e.self:CastSpell(6188, e.self:GetID());
        eq.stop_timer(e.timer);
        eq.set_timer("defiance", 60000);
    elseif (e.timer == "touch") then
        e.self:CastSpell(6189, e.self:GetID());
    elseif (e.timer == "defiance") then
        e.self:CastSpell(6188, e.self:GetID());
    end
end

