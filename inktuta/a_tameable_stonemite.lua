--mites depop in 10 mins of no combat

function event_spawn(e)
	eq.set_timer("depop", 600 * 1000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_combat(e)
	if e.joined then
		if not eq.is_paused_timer("depop") then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end
