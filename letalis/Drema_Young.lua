function event_spawn(e)
	eq.set_timer("depop", 1800 * 1000);
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end

function event_death(e)
	e.self:Say("Thank you for releasing me. Avenge me by defeating that insidious Vampire!");
end