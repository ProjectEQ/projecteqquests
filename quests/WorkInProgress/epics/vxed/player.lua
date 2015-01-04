--vxed/player.lua  
--BiC / Warrior Epic 1.5
function event_combine_success(e)
	if (e.recipe_id == 10344) then
		e.self:Message(1,"With the final piece in place, the clockwork scout's eyes light up as it comes to life.");
		eq.spawn2(290059,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Clockwork Scout Model XIII
	end
end

function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals["warrior_epic_vxed"] == "1" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(NPCID) == false) then
		--eq.spawn2( ,0,0,-1129,-499,470,198.6); --#Borer Trigger
	end
end
