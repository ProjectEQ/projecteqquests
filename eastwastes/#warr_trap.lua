--eastwastes/#Larnik_Trigger.lua NPCID 
--Warrior Epic 2.0
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 100, xloc + 100, yloc - 100, yloc + 100);
end

function event_enter(e)
local zone_time = eq.get_zone_time();	
	if(e.other:HasItem(60324) and zone_time["zone_hour"]>=20 and zone_time["zone_hour"]<= 23 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(116609) == false) then --Fazzle's Map of East Wastes
		eq.spawn2(116609,270,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Larnik_the_Recluse
		eq.depop_with_timer();
	end
end

