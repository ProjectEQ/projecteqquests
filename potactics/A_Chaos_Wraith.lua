-- A_Chaos_Wraith (214114)) part of rztwl script

function event_spawn(e)
	eq.set_timer('timetomove', 2 * 1000);
	eq.set_timer('depop', 900 * 1000);
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	eq.set_timer("OOBcheck", 6 * 1000);
	else
		eq.resume_timer('depop');
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		eq.stop_timer("OOBcheck");
	end
end

function event_timer(e)
	if (e.timer == 'depop') then
		eq.depop();
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
		if (e.self:GetX() > 950) then
			e.self:GotoBind();
			e.self:WipeHateList();
			eq.set_timer('timetomove', 2 * 1000);
		else
			eq.set_timer("OOBcheck", 6 * 1000);
		end
	elseif (e.timer == 'timetomove') then
		eq.stop_timer('timetomove');
		local rallos = eq.get_entity_list():GetMobByNpcTypeID(214113);	--#Rallos_Zek_the_Warlord (214113)
		eq.move_to(rallos:GetX(),rallos:GetY(),rallos:GetZ(),rallos:GetHeading(),true);
		e.self:SetRunning(true);
	end
end
