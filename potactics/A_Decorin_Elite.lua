function event_spawn(e)
eq.set_timer('depop', 900 * 1000);
eq.set_timer('timetomove', 50 * 1000);
e.self:SetRunning(true);
end

function event_combat(e)
if (e.joined == true) then
if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	else
		eq.resume_timer('depop');
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end

function event_timer(e)
	if (e.timer == 'depop') then
		eq.depop();
	elseif (e.timer == 'timetomove') then
		local fakerz = eq.get_entity_list():GetMobByNpcTypeID(214109);	--#Rallos_Zek (214109)

		if (fakerz.valid) then
		eq.move_to(fakerz:GetX(),fakerz:GetY(),fakerz:GetZ(), fakerz:GetHeading(),true); --goes to fake rz if hes up
		eq.stop_timer('timetomove');
		end
		
		local rztwl = eq.get_entity_list():GetMobByNpcTypeID(214113);	--#Rallos_Zek_the_Warlord (214113)
	
		if (rztwl.valid) then
		eq.move_to(rztwl:GetX(),rztwl:GetY(),rztwl:GetZ(),rztwl:GetHeading(),true); --goes to rztwl if hes up
		eq.stop_timer('timetomove');
		end
	end
end
