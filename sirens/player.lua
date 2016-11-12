--sirens/player.lua

--Ench 1.5 Chest
function event_loot(e)
	if(e.self:Class() == "Enchanter" and e.item:GetID() == 52961) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["ench_epic"] >= "3" and qglobals["ench_epic_sirens"] == nil  ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("ench_epic_sirens","1",5,"F");
		end
	end
end

  
--Wizard Epic 1.5 Spawn Mistress
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();
	
	if(qglobals["wiz_epic_mistress_respawn"] == nil and qglobals["wiz_epic_wisp"] == "1" and el:IsMobSpawnedByNpcTypeID(125045) == false) then
		eq.unique_spawn(125075,0,0,-49,170,-53,127); --Mistress of the Darkwater Quest-only
	end
end