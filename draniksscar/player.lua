--draniksscar
local recepactive=false;

function event_enter_zone(e)
	if(e.self:Class() == "Warrior" ) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["warrior_epic"] ~= nil and qglobals["warrior_epic"] >= "2") then
			eq.set_timer("borer",5000);
		end
	end
end

function event_timer(e)
	if(e.timer == "borer") then
		if(e.self:GetItemIDAt(30)==60300 and recepactive==false) then --energy receptor on cursor
			e.self:Message(4,"The energy receptor appears to be active");		
			eq.depop_all(302050);
			eq.spawn2(302050, 0, 0, 155,-1053,29.5, 76);
			eq.create_ground_object(60301,155,-1053,29.5,0,150000);	
			recepactive=true;
		end
	end
end

function event_loot(e)
	if(e.self:Class() == "Beastlord" and e.item:GetID() == 52907) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["beast_epic"] == "15" and qglobals["beast_epic_ds"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("beast_epic_ds","1",5,"F");
		end
	end	
end

function event_click_door(e)
  local door_id = e.door:GetDoorID();
  local inst_id;
  --watering hole
  if (door_id == 2) then 
	inst_id=eq.get_instance_id('dranikhollowsa', 0);
	if (inst_id > 0 ) then
		e.self:MovePCInstance(318, inst_id, 3522.5, 1584.2, 2.8, 70);
    else		
      e.self:Message(13, "You are not part of an instance.");		
	end
  --firepit
  elseif (door_id == 3) then  
	inst_id=eq.get_instance_id('dranikhollowsb', 0);
	if (inst_id > 0 ) then
		e.self:MovePCInstance(319, inst_id, 0, -447 , -38.5, 254);
    else		
      e.self:Message(13, "You are not part of an instance.");		
	end
	--murkglider
  elseif (door_id==4) then
	inst_id=eq.get_instance_id('dranikhollowsc', 0);
	if (inst_id > 0 ) then
		e.self:MovePCInstance(320, inst_id, 3944, -252, 139, 254);
    else		
      e.self:Message(13, "You are not part of an instance.");		
	end
  end
end
