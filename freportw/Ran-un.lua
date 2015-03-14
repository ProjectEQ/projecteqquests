function event_spawn(e)
	eq.set_timer("spar1", 5000);
end

function event_timer(e)
	if(e.timer == "spar1") then
		e.self:DoAnim(eq.ChooseRandom(1,5,6,7,11,30,45,46,47));
	end
end

-- END of FILE Zone:freportw -- Ran`un 