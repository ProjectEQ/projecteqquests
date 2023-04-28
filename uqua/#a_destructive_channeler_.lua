function event_combat(e)
	if e.joined then
		eq.set_timer("OOBcheck", 3 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end

function event_timer(e)
	if e.timer=="OOBcheck" then
		eq.stop_timer("OOBcheck");
		if e.self:GetY() < -184 then
			e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
			e.self:GotoBind();
			e.self:WipeHateList();
		else
			eq.set_timer("OOBcheck", 3 * 1000);
		end
	elseif e.timer == "aoe" then
		local get_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),100 * 100);
		--get client within 100 radius		
		if get_client.valid then
			e.self:CastSpell(5056,get_client:GetID()); --Spell: rampaging force
		end
	end
end


function event_spawn(e)
	eq.set_timer("aoe", 195 * 1000); --3 min 15 sec
end

