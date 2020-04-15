function event_spawn(e)
eq.set_timer('depop', 3600 * 1000);
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	eq.set_timer('adds', 60 * 1000);
	else
		eq.resume_timer('depop');
		eq.stop_timer('adds');
	end
end

function event_timer(e)
	if (e.timer == 'depop') then
		eq.unique_spawn(210179,0,0,346,-2513,-440.5,0); --repop untargetable version
		eq.depop();
	elseif (e.timer == 'adds') then
		local which = math.random(2,8);
    		if  (which == 2) then
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
		elseif (which == 3) then
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
		elseif (which == 4) then
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
		elseif (which == 5) then
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
		elseif (which == 6) then
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
		elseif (which == 7) then
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
		elseif (which == 8) then
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
			eq.spawn2(eq.ChooseRandom(210233,210234), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_mangled_traveller (210233), a_lost_soul (210234)
		end

	end
end
