function event_spawn(e)
	eq.set_timer("help",150000);
end

function event_timer(e)
	if(e.timer == "help") then
		if(math.random(2) == 1) then
			e.self:Say("if only someone were to use the lever, we could escape from here and find help.");
		else
			e.self:Say("Grrrr. You are a foolish whelp. Be quiet, or the elementals will kill us.");
		end
	end
end
