function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();
	
	if(qglobals["ranger_epic"] == "1" and qglobals["ranger_epic_wyv"] == nil and el:IsMobSpawnedByNpcTypeID(120136) == false) then
		eq.unique_spawn(120136,21,0,-2671,1038,-23,188); -- NPC: a_neuralgic_huntress
		eq.set_global("ranger_epic_wyv","1",3,"H2");
	end	
end

function event_loot(e)
	if(e.self:Class() == "Shadow Knight" and e.item:GetID() == 55901 ) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["shadowknight_epic"] == "8")  then
			if(qglobals["sk_westwastes"] == nil) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("sk_westwastes","1",5,"F");
			end
		else
			return 1;
		end
	end
end
