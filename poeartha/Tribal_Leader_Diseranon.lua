function event_spawn(e)
eq.set_timer('depop', 900 * 1000);
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
