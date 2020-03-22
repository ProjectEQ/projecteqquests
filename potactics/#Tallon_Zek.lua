-- #Tallon_Zek (214108) part of RZTWL script
function event_spawn(e)
    eq.set_timer("despawn", 2700000) -- 45 mins
    e.self:SetRunning(true);
end

function event_death_complete(e)
    eq.signal(214123, 214108) -- tell trigger that Tallon is dead
    eq.signal(214086,1); -- tell the Hendin's to start their timer on depop
end

function event_signal(e)
    eq.depop();
    eq.depop_all(214086);
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
    elseif (e.timer == "despawn") then
        eq.depop();
	eq.depop_all(214068); -- depop all of my Hendin's
    end
end

function event_waypoint_arrive(e)
	if(e.wp == 9) then
        eq.spawn2(214086,0,0,301,-57,169,0); --Hendin_Shadow_Master (214086)
        eq.spawn2(214086,0,0,271,-57,169,0); --Hendin_Shadow_Master (214086)
        eq.spawn2(214086,0,0,361,-57,169,0); --Hendin_Shadow_Master (214086)
        eq.spawn2(214086,0,0,391,-57,169,0); --Hendin_Shadow_Master (214086)
    end
end
