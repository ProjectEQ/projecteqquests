-- (214139) no loot 2.5 min depop
function event_spawn(e)
eq.set_timer('depop', 150 * 1000);
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
end
end
