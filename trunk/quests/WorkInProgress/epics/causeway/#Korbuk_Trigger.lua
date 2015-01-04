--causeway/#Korbuk_Trigger.lua NPCID 
--Warrior Epic 2.0
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["warrior_epic"] == "20" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(NPCID) == false) then --NPCID is Korbuk_Brimlade ID
		--eq.spawn2( ,0,0,,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Korbuk_Brimlade
		eq.depop_with_timer();
	end
end