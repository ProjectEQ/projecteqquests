function event_spawn(e)
	eq.set_timer('depop', 5 * 60 * 1000);
	eq.set_timer('timetomove', 50 * 1000);
end

function event_combat(e)
if (e.joined == true) then
if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	else
		eq.resume_timer('depop');
	end
end

function event_timer(e)
if (e.timer == 'depop') then
eq.depop();
elseif (e.timer == 'timetomove') then
local glykus = eq.get_entity_list():GetMobByNpcTypeID(214053);	--Glykus_Helmir (214053)
eq.move_to(glykus:GetX(),glykus:GetY(),glykus:GetZ(), glykus:GetHeading(),true);
e.self:SetRunning(true);
end
end

function event_death_complete(e)
local Glykus = eq.get_entity_list():GetMobByNpcTypeID(214053);
	if (Glykus.valid and Glykus:IsEngaged()) then
    eq.spawn2(214040,0,0,1386,-926,-296,70); -- NPC: a_Fledgling_War_Boar
  end
end
