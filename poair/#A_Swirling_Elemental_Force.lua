--starts a 14 minute depop timer when enters combat, the timer does not stop even while in combat

function event_combat(e)
	if (e.joined) then
		eq.set_timer("depop", 840000)
	end
end

function event_timer(e)
eq.depop_with_timer();
end
