function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();	
	if(qglobals["mage_epic_air1"] == "1" and qglobals["air_ess_respawn"] == nil and not el:IsMobSpawnedByNpcTypeID(303100)) then
		eq.load_encounter('mageepic_1_5');
		eq.unique_spawn(303100,0,0,-1097,-1732,254,0); -- NPC: Elemental_Essence_of_Air
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
	elseif (e.self:Class() == "Bard" and e.item:GetID() == 77644 and e.corpse:GetNPCTypeID() == 303125) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["bard20"] == "1") then
			if (qglobals["bard20_chest"] == nil) then
				eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
				eq.set_global("bard20_chest", "1", 5, "F");
			end
			return 0;
		else
			return 1;
		end
	elseif (e.self:Class() == "Warrior" and e.item:GetID() == 60330 and e.corpse:GetNPCTypeID() == 303129) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["warrior_epic"] == "20") then
			if (qglobals["warr_chest_causeway"] == nil) then
				eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
				eq.set_global("warr_chest_causeway", "1", 5, "F");
			end
			return 0;
		else
			return 1;
		end
	elseif (e.self:Class() == "Berserker" and e.item:GetID() == 17349 and e.corpse:GetNPCTypeID() == 303081) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["berserk_epic"] == "9") then
			if (qglobals["ber_chest_causeway"] == nil) then
				eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
				eq.set_global("ber_chest_causeway", "1", 5, "F");
			end
			return 0;
		else
			return 1;
		end
	elseif (e.self:Class() == "Beastlord"  and (e.item:GetID() == 57012 or e.item:GetID() == 57013)) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["beast_epic"] == "18") then
			return 0;
		else
			return 1;
		end
	elseif (e.self:Class() == "Enchanter"  and (e.item:GetID() == 52951)) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["ench_epic"] == "9") then
			if (qglobals["ench_chest_causeway"] == nil) then
				eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
				eq.set_global("ench_chest_causeway", "1", 5, "F");
			end
			return 0;
		else
			return 1;
		end
	end
end
