function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 30, e.self:GetX() + 30, e.self:GetY() - 30, e.self:GetY() + 30);
end

function event_enter(e)
	if(e.other:Class() == "Warrior") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if(qglobals["warrior_epic"] == "20" and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(303129) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(303128)) then	
			eq.spawn2(303128, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),100); --Korbuk
			eq.depop_with_timer();
		end
	end
end
