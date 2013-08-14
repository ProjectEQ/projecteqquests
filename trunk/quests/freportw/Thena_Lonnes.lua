function event_spawn(e)
	eq.set_timer("spar2", 3000);
end

function event_timer(e)
	if(e.timer == "spar2") then
		local anivar2 = eq.ChooseRandom(1,5,6,7,11,30,45,46,47);
		e.self:DoAnim(anivar2);
	end
end

-- END of FILE Zone:freportw -- Thena_Lonnes 