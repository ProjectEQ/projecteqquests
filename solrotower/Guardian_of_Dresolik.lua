function event_combat(e)
if (e.joined == true) then
eq.set_timer("OOBcheck", 6 * 1000);
else
eq.stop_timer("OOBcheck");
end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 546 or e.self:GetX() > 994) then
		e.self:Say("Dresolik must not be disturbed!");
		e.self:CastSpell(2830, e.self:GetID())
		e.self:SetHP(e.self:GetMaxHP());
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end

function event_death_complete(e)
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(212046) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(212062) == true) then
		eq.spawn2(212061,0,0,607,1585,-162,126); --The_Protector_of_Dresolik
		eq.depop_with_timer(212062);
	end
end
