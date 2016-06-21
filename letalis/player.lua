function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();	
	if(qglobals["mage_epic_earth1"] == "1" and qglobals["earth_ess_respawn1"] == nil and el:IsMobSpawnedByNpcTypeID(169127) == false) then
		eq.unique_spawn(169127,0,0,291,241,203,70);		
		eq.set_global("earth_ess_respawn1","1",2,"H2");
	end	
end

function event_loot(e)
	if(e.self:Class() == "Magician" and e.item:GetID() == 19087 ) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["mage_epic_earth1"] == "1" and qglobals["mage_epic_letalis"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("mage_epic_letalis","1",5,"F");
		end
	end	
end