function event_spawn(e)
eq.set_timer('depop', 300 * 1000);
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
eq.signal(210230,0); --signal gurebk to subtract an add counter
eq.depop();
end
end

function event_death_complete(e)
eq.signal(210230,0); --signal gurebk to subtract an add counter
end
