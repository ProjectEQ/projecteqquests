function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();	
	if(qglobals["mage_epic_air1"] == "1" and qglobals["air_ess_respawn"] == nil and el:IsMobSpawnedByNpcTypeID(303100) == false) then
		eq.load_encounter('mageepic_1_5');
		eq.unique_spawn(303100,0,0,-1097,-1732,254,0);		
		eq.set_global("air_ess_respawn","1",2,"H2");
	end	
end

function event_loot(e)
	if(e.self:Class() == "Magician" and e.item:GetID() == 16773) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["mage_epic_air1"] == "1" and qglobals["mage_epic_causeway"] == nil) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("mage_epic_causeway","1",5,"F");
		end
	elseif (e.self:Class() == "Necromancer" and e.item:GetID() == 55855) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["Soulwhisper"] == "3" and qglobals["nec_epic_causeway"] == nil) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("nec_epic_causeway","1",5,"F");
		end		
	end	
end