function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 100, e.self:GetX() + 100, e.self:GetY() - 100, e.self:GetY() + 100);
end

function event_enter(e)
	if(e.other:Class() == "Druid") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if(qglobals["druid_epic"] == "10" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(302086) == false ) then	
			eq.spawn2(302086, 0, 0, 1051,-708.5,437,0); -- NPC: Tranlinor_the_Maimed
			eq.depop_with_timer();
		end
	end
end