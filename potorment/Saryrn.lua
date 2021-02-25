function event_spawn(e)
    eq.set_next_hp_event(98);
    eq.set_timer('spawnsorrow', 5 * 1000);
end

function event_hp(e)
    if(e.hp_event == 98) then
        eq.signal(207052,1); -- NPC: Sorrowsong
        e.self:Say("Sorrowsong, sing for us. We want these wretches to enjoy their stay, don't we?");
        eq.set_next_hp_event(90);
        eq.set_next_inc_hp_event(99); --to reset on event failure
    elseif (e.hp_event == 90) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
        eq.set_next_hp_event(80);
    elseif (e.hp_event == 80) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
        eq.set_next_hp_event(70);
    elseif (e.hp_event == 70) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
        eq.set_next_hp_event(60);
    elseif (e.hp_event == 60) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
        eq.set_next_hp_event(50);
    elseif (e.hp_event == 50) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
        eq.set_next_hp_event(40);
    elseif (e.hp_event == 40) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
        eq.set_next_hp_event(30);
    elseif (e.hp_event == 30) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
        eq.set_next_hp_event(25);
    elseif (e.hp_event == 25) then
        eq.spawn2(207065, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: #Sorrowsong
        e.self:Say("This filth is proving to be a challenge!  Sorrowsong, attack these mortals!");
        eq.depop(207052);
        eq.set_next_hp_event(20);
    elseif (e.hp_event == 20) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
        eq.set_next_hp_event(10);
    elseif (e.hp_event == 10) then
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -12, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, -1, -72, 579, 1);
        eq.spawn2(eq.ChooseRandom(207085,207086), 0, 0, 10, -72, 579, 1);
    end
    
    if e.inc_hp_event == 99 then
		eq.set_next_hp_event(98);
	end
end

function event_combat(e)
    if (e.joined == true) then
        eq.stop_timer('reset');
        eq.set_timer('zcheck', 6 * 1000);
    else
        eq.set_timer('reset', 300 * 1000);
        eq.stop_timer('zcheck');
    end
end

function event_timer(e)
    if (e.timer == 'reset') then
        eq.stop_timer('reset');
        eq.set_next_inc_hp_event(99); --to reset on event failure
        eq.depop(207052);
        eq.depop(207065);
        eq.set_timer('spawnsorrow', 5 * 1000);
    elseif (e.timer == 'spawnsorrow') then
        eq.stop_timer('spawnsorrow');
        eq.unique_spawn(207052, 0, 0, 1, 2, 579, 247); -- NPC: Sorrowsong
    elseif (e.timer == 'zcheck') then
        if e.self:GetZ() < 520 then
            e.self:Emote("dissolves into a swirling mist and moves back across the room");
            e.self:GotoBind()
        end
    end
end

function event_death_complete(e)
    eq.unique_spawn(218068, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: A_Planar_Projection
end
