function event_loot(e)
	if(e.self:Class() == "Warrior" and e.item:GetID() == 60321 and e.corpse:GetNPCTypeID()==336091) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["warrior_epic"] == "15" and qglobals["warrior_epic_dranik"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("warrior_epic_dranik","1",5,"F");
		elseif ((qglobals["warrior_epic"] == nil or qglobals["warrior_epic"] <= "14") ) then
			eq.set_timer("deletehackepic",1000);
		end
	end	
	if(e.self:Class() == "Beastlord" and e.item:GetID() == 52910) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["beast_epic"] == "16" and qglobals["beast_epic_dran"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("beast_epic_dran","1",5,"F");
		end
	end		
end

function event_timer(e)
	if(e.timer == "deletehackepic") then
--	e.self:Message(15,"timer");
		if(e.self:HasItem(60321)==true) then
--		e.self:Message(15,"hasitem");
			e.self:NukeItem(60321);
			e.self:Message(15,"Deleting 60321, character is not at the proper step in epic");
		else
			eq.stop_timer("deletehackepic");
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
      e.self:MovePCInstance(328, dca0, 0, 0, -10.49, 254);
	elseif (dca1 > 0) then
	  e.self:MovePCInstance(328, dca1, 0, 0, -10.49, 254);
	elseif (dcb0 > 0) then
	  e.self:MovePCInstance(329, dcb0, 212.58, 650.72, -14.78, 144);
	elseif (dcc0 > 0) then
	  e.self:MovePCInstance(330, dcc0, -10.17, -214.3, -3.35, 57);	  
    else		
      e.self:Message(13, "You are not part of an instance.");
    end     
  end
end