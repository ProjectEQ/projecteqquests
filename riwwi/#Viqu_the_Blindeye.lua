function event_spawn(e)
    eq.set_next_hp_event(45)
end

function event_hp(e)
    if (e.hp_event == 45) then
        eq.set_timer("casting", 1000)
        eq.set_next_inc_hp_event(45)
    elseif (e.inc_hp_event == 45) then
        eq.stop_timer("casting")
        eq.set_next_hp_event(45)
    end
end

function event_timer(e)
    if (e.timer == "casting") then
        e.self:CastSpell(eq.ChooseRandom(4850, 4849, 4851), e.self:GetTarget():GetID())
        eq.set_timer("casting", 10 * math.random(1, 3) * 1000)
    end
end

