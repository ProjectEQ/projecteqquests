--depops in 3 mins of no aggro

function event_spawn(e)
eq.set_timer("depop", 180 * 1000);
end

function event_timer(e)
if (e.timer == "depop") then
eq.stop_timer("depop");
eq.depop();
end
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
