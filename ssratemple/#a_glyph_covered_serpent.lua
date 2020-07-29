function event_spawn(e)
	eq.zone_emote(0,"A roar fills the lower temple halls! The smell of burning ozone and decay fills the air!");
	eq.set_timer('depop', 1800 * 1000);
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
	end
end

function event_death_complete(e)
	eq.signal(162255,1); -- #cursed_controller
	eq.set_global("glyphed_dead",1,3,"D3");
end
