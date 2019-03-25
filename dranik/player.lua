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

function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 7) then  
	local dca0 = eq.get_instance_id('dranikcatacombsa', 0);
	local dca1 = eq.get_instance_id('dranikcatacombsa', 1); --paladin 1.5
	local dcb0 = eq.get_instance_id('dranikcatacombsb', 0);
	local dcc0 = eq.get_instance_id('dranikcatacombsc', 0);
	--MovePCInstance(Integer zone, Integer instance, Real x, Real y, Real z, Real heading);
    if (dca0 > 0) then
      e.self:MovePCInstance(328, dca0, 0, 0, -10.49, 508); -- Zone: rujj
	elseif (dca1 > 0) then
	  e.self:MovePCInstance(328, dca1, 0, 0, -10.49, 508); -- Zone: rujj
	elseif (dcb0 > 0) then
	  e.self:MovePCInstance(329, dcb0, 212.58, 650.72, -14.78, 288); -- Zone: runnyeye
	elseif (dcc0 > 0) then
	  e.self:MovePCInstance(330, dcc0, -10.17, -214.3, -3.35, 114); -- Zone: scarlet	  
    else		
      e.self:Message(13, "You are not part of an instance.");
    end
  elseif (door_id==8) then
  	local dsa0 = eq.get_instance_id('draniksewersa', 0);
	local dsb0 = eq.get_instance_id('draniksewersb', 0);
	local dsc0 = eq.get_instance_id('draniksewersc', 0);
	--MovePCInstance(Integer zone, Integer instance, Real x, Real y, Real z, Real heading);
    if (dsa0 > 0) then
      e.self:MovePCInstance(331, dsa0, 3, 0, -3, 254); -- Zone: sebilis
	elseif (dsb0 > 0) then
	  e.self:MovePCInstance(332, dsb0, 2, 5, -4.8, 260); -- Zone: shadeweaver
	elseif (dsc0 > 0) then
	  e.self:MovePCInstance(333, dsc0, -2.5, 4, -6, 0); -- Zone: shadowhaven	  
    else		
      e.self:Message(13, "You are not part of an instance.");
    end
  end
end
