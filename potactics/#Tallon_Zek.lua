-- #Tallon_Zek (214108) part of RZTWL script
function event_spawn(e)
    eq.set_timer("despawn", 2700000) -- 45 mins
    e.self:SetRunning(true);
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

