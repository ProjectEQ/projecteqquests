function event_spawn(e)
eq.set_timer("roll",4*1000);
end

function event_timer(e)
	if (e.timer == "roll") then
		local rand = math.random(1,100);
		if (rand <= 50) then
			eq.get_entity_list():MessageClose(e.self, false, 100, 0, "The storm clouds pass harmlessly.");
		end
		eq.depop();
	end
end
