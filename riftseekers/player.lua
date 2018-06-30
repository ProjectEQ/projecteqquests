function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);	
	if(qglobals["ranger_epic"] == "8" and qglobals["rng_spawn_rss"] == nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(334087) == false) then
		eq.load_encounter("ranger_2_0");
		eq.unique_spawn(334087,0,0,2.8,1382,60.5,320); --#Craftmaster_Tieranu (334087)	
		eq.set_global("rng_spawn_rss","1",2,"H2");
	end	
end


function event_loot(e)
	if(e.self:Class() == "Ranger" and e.item:GetID() == 11427) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["ranger_epic"] == "8") then
			if(qglobals["rng_rss_chest"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 2.0)
				eq.set_global("rng_rss_chest","1",5,"F");
			end
		else
			return 1;
		end		
	end
end
