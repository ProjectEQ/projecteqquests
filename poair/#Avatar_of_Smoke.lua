function event_combat(e)
	if e.joined then
			if(not eq.is_paused_timer("despawn")) then
				eq.pause_timer("despawn");
			end
		eq.set_timer('Hardblur', 180 * 1000);
		eq.set_timer('Softblur', 6 * 1000);
	else
		eq.stop_timer('Hardblur');
		eq.stop_timer('Softblur');
		eq.resume_timer("despawn");
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); 
	end
end

function event_timer(e)
	if (e.timer == 'Hardblur') then
		e.self:WipeHateList();
	elseif (e.timer == 'Softblur') then
		if (math.random(100)<=5) then
			e.self:WipeHateList();
		end
	elseif (e.timer == "despawn") then
			eq.stop_timer("despawn");
			eq.depop();
	end
end


function event_spawn(e)
	eq.set_timer("despawn", 2700 * 1000);
	e.self:Shout("The time has come for all intruders to be tested! I will not allow you to pillage this plane any longer!");
end

function event_death_complete(e)
eq.signal(215453,3); -- NPC: #Smoke_Trigger
end
