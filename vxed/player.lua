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
	if (qglobals["warrior_epic_vxed"] == "1" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(290070) == false) then
		eq.spawn2(290070 ,0,0,-720,-3200,15.1,256); --Blackfall Boreling
		eq.spawn2(290070 ,0,0,272.5,-2099,237,114); -- NPC: Blackfall_Borerling
		eq.spawn2(290070 ,0,0,-1600,-1700,326.1,304); -- NPC: Blackfall_Borerling
	end
end

function event_loot(e)
	if(e.self:Class() == "Paladin" and e.item:GetID() == 69944 and e.self:HasItem(69924)) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["paladin_epic"] >= "5" and qglobals["paladin_epic_vxed"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("paladin_epic_vxed","1",5,"F");
		end
	end
end

function event_click_door(e)
	if e.door:GetDoorID() == 7 then -- obelisk zone out behind Stonespiritist Ekikoa
		-- if player hasn't hailed Stonespiritist Ekikoa to get either temp or
		-- permanent Vxed flag then the port out stone doesn't work for them.
		-- Unknown what happens if at flagged cap (if live even has one anymore)
		local qglobals = eq.get_qglobals(e.self) -- god_kodtaz_access currently represents permanent flag
		local has_perm_flag = (qglobals.god_tipt_access and qglobals.god_tipt_access == "1")
		local has_temp_flag = (eq.get_data(string.format("%s-god_vxed", e.self:CharacterID())) == "T")

		if not has_temp_flag and not has_perm_flag then
		  e.self:Message(15, "You become dizzy as you inspect the stone slab.")
		  return 1 -- prevent zone out
		end
	end
end
