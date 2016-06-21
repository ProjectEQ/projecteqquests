--lfay
function event_enter_zone(e)
	local instance_id = eq.get_instance_id("mmcc",50);
	if (instance_id > 0) then                                  
		e.self:MarkSingleCompassLoc(3880, -120, 116);   
	end   
end

function event_click_door(e)
  local door_id = e.door:GetDoorID();
  local entity_list = eq.get_entity_list();
	if(door_id == 10) then --Asylum of Invoked Stone (mmcc) zone in
		local instance_id = eq.get_instance_id("mmcc",50);       
		if (instance_id > 0) then                                  
			e.self:MovePCInstance(243, instance_id, -467.37,-104.22,10.34,0);   
		else                                                       
			e.self:Message(13, "You are not a part of an instance!");
		end  
	elseif (door_id == 11) then --Scion Lair of Fury (mmcf) zone in
		local instance_id = eq.get_instance_id("mmcf",50); 	
		if (instance_id > 0) then                                  
			e.self:MovePCInstance(258, instance_id, 607,1503,33,0);   
		else                                                       
			e.self:Message(13, "You are not a part of an instance!");
		end 
	end
end

function event_zone(e)
  e.self:ClearCompassMark();
end


function event_loot(e)
	if(e.self:Class() == "Cleric") then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["cleric_epic"] >= "4" and qglobals["cleric_epic_lfay"] == nil and e.item:GetID() == 9585 ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("cleric_epic_lfay","1",5,"F");
		end
	end
end