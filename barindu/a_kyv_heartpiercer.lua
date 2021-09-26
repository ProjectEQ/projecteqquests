function event_spawn(e)
    eq.set_next_hp_event(45)
end

function event_hp(e)
    if (e.hp_event == 45) then
        eq.set_timer("casting", 20 * 1000) -- chance to fire every 20 sec
        eq.set_next_inc_hp_event(45)
    elseif (e.inc_hp_event == 45) then
        eq.stop_timer("casting")
        eq.set_next_hp_event(45)
    end
end

function event_timer(e)
    if (e.timer == "casting") then
        local roll = math.random(100)
        if (roll >= 50) then
        e.self:Emote("releases a volley of arrows.");
        e.self:CastSpell(eq.ChooseRandom(4850, 4849, 4851), e.self:GetTarget():GetID())
        eq.set_timer("casting", 20  * 1000)
        end
    end
end

