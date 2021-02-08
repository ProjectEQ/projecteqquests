function event_spawn(e)
eq.set_timer("roll",4*1000);
end

function event_timer(e)
	if (e.timer == "roll") then
		local rand = math.random(1,100);
		if (rand <= 33) then
			eq.get_entity_list():MessageClose(e.self, false, 100, 0, "The storm clouds pass harmlessly.");
			eq.depop();
		elseif (rand > 33 and rand <= 66) then
			e.self:CastSpell(1024,e.self:GetID()); --thunderclap
		elseif (rand > 66 and rand <= 100) then
			eq.depop();
		end
	end
end

function event_cast(e)
eq.depop();
end
