function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 50, e.self:GetX() + 50, e.self:GetY() - 50, e.self:GetY() + 50);
end

function event_enter(e)
	if(e.other:Class() == "Shaman") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if(qglobals["shaman_epic"] == "10" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(210250) == false ) then					
			eq.spawn2(210250, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Darkened_Chanting_Woodspirit
			eq.depop_with_timer();
		end
	end
end