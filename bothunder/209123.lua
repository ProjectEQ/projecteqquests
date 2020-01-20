function event_spawn(e)
eq.set_timer("roll",4*1000);
end

function event_timer(e)
	if (e.timer == "roll") then
		local rand = math.random(1,100);
		if (rand <= 33) then
			eq.get_entity_list():MessageClose(e.self, false, 100, 0, "The storm clouds pass harmlessly.");
		elseif (rand <= 66 and rand > 33) then
			e.self:SpellFinished(1024,e.self); --thunderclap
		end
		eq.depop();
	end
end
