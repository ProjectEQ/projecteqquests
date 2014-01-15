function event_spawn(e)
	eq.set_timer("nilly",math.random(750000));
end

function event_timer(e)
	local random_say = math.random(2);
	
	if(random_say == 1) then
		e.self:Say("Nillipuss is my name. Stealing jumjum is my game. Think you can catch me? Let's see if you can! I'll always run faster than you ever ran.");
	else
		e.self:Say("Look what I've found! What a great find! It used to be yours, but now it is mine!");
	end
	eq.set_timer("nilly",math.random(750000));
end
	