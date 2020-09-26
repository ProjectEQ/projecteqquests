function event_loot(e)
	if(e.self:Class() == "Warrior" and e.item:GetID() == 60321 and e.corpse:GetNPCTypeID()==336091) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["warrior_epic"] == "15") then
			if(qglobals["warrior_epic_dranik"] == nil) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("warrior_epic_dranik","1",5,"F");
			end
		else
			return 1;
		end
	end
	
	if(e.self:Class() == "Beastlord" and e.item:GetID() == 52910) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["beast_epic"] == "16") then
			if(qglobals["beast_epic_dran"] == nil ) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("beast_epic_dran","1",5,"F");
			end
		else
			return 1;
		end
	end
	
	if(e.self:Class() == "Druid" and e.item:GetID() == 62859) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["druid_epic"] == "7") then
			if(qglobals["druid_chest_dranik"] == nil ) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("druid_chest_dranik","1",5,"F");
			end
		else
			return 1;
		end
	end
	
	if(e.self:Class() == "Shaman" and e.item:GetID() == 57315) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["shaman_epic"] == "11") then
			if(qglobals["shaman_chest_dranik"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 2.0)
				eq.set_global("shaman_chest_dranik","1",5,"F");
			end
		else
			return 1;
		end
	end

	if(e.self:Class() == "Necromancer" and (e.item:GetID() == 55940 or e.item:GetID() == 55932)) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["necro_epic"] == "5") then
			if(qglobals["nec_chest_dranik"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 2.0)
				eq.set_global("nec_chest_dranik","1",5,"F");
			end
		else
			return 1;
		end
	end
	
	if(e.self:Class() == "Shadow Knight" and e.item:GetID() == 55903) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["shadowknight_epic"] == "11") then
			if(qglobals["sk_chest_dranik"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 2.0)
				eq.set_global("sk_chest_dranik","1",5,"F");
			end
		else
			return 1;
		end
	end		
end


local door_ids = {
  [7] = { dranikcatacombsa = true, dranikcatacombsb = true, dranikcatacombsc = true }, -- { [328] = true, [329] = true, [330] = true }
  [8] = { draniksewersa = true, draniksewersb = true, draniksewersc = true }           -- { [331] = true, [332] = true, [333] = true }
}

function event_click_door(e)
  local door_id = e.door:GetDoorID();

  local zone_names = door_ids[door_id]
  if zone_names then
    local dz = e.self:GetExpedition()
    if dz.valid and zone_names[dz:GetZoneName()] then
      e.self:MovePCDynamicZone(dz:GetZoneID())
    end
  end
end
