function event_spawn(e)
    eq.set_timer("despawn", 2700000) -- 45 mins
    eq.set_timer("1", 1000)
end

function event_death_complete(e)
    eq.signal(214123, 214108) -- tell trigger that Tallon is dead
end

function event_signal(e)
    eq.depop()
end

function event_timer(e)
    if e.timer == "despawn" then
        eq.depop()
    elseif e.timer == "1" and e.self:GetX() < 340 and e.self:GetY() > -68 then
        eq.pause(2700)
    end
end

function event_combat(e)
    if e.joined == true then
        eq.set_timer("barb", math.random(1, 4) * 1000)
    else
        eq.stop_timer("barb");
    end
end

function event_timer(e)
    if (e.timer == "barb") then
        e.self:CastSpell(eq.ChooseRandom(2449, 2450, 2451, 2452), e.self:GetTarget():GetID())
        eq.set_timer("barb", math.random(2, 6) * 1000)
    end
end

