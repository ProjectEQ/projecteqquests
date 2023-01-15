function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_timer(e)
	eq.depop_with_timer();
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end
