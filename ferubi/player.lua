function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();
	
	if(e.self:HasItem(69924) and qglobals["paladin_epic_ferubi"] == nil and el:IsMobSpawnedByNpcTypeID(284104) == false) then
		eq.unique_spawn(284104,0,0,883,703,98.5,64); -- NPC: Shade_of_Reiya_the_Pained
		eq.set_global("paladin_epic_ferubi","1",3,"H2");
	end
	if(qglobals["mage_epic"] == "10" and qglobals["mage_epic_ferubi"] == nil) then
		e.self:Message(15,"Your staff begins to glow");
	end
end


function event_loot(e)
	if(e.self:Class() == "Magician" and e.item:GetID() == 19447 and e.corpse:GetNPCTypeID()==284105) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["mage_epic"] == "10") then
			return 0;
		else
			return 1;
		end
	end
end
