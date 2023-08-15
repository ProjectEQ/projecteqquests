function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 75, e.self:GetX() + 75, e.self:GetY() - 75, e.self:GetY() + 75);
end

function event_enter(e)
	if(e.other:Class() == "Ranger") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if qglobals["ranger_epic"] == "6" and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(303091) then
			eq.spawn2(303091, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),100); --Siflu
			eq.depop_with_timer();
		end
	end
end
