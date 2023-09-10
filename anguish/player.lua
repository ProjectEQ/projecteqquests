function event_click_door(e)
	local door_id = e.door:GetDoorID();
	  if door_id == 61 then	
		  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317002) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317003) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317004) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317005) then
			  -- e.self:Message(MT.Red,"Success Message?");
			  local instance_id = eq.get_zone_instance_id();
			  -- e.self:MovePC(317, 504, 4729, 277.6, 0);
			  e.self:MovePCInstance(317,instance_id, 504, 4729, 277.6, 0)
			  -- so we need to signal to OMM about the click but we don't want to have any weird race with signal processing and client getting up there
			  e.self:SetEntityVariable("clicked_up", "1");
			  eq.signal(317109,1); -- signal OMM that a click up happened
		  else
			  e.self:Message(MT.Red,"The seal doesn't react to your presence.");
		  end
	  end
	  
	  if door_id == 57 or door_id ==58 or door_id ==59 or door_id ==60 then
		  if eq.get_entity_list():IsMobSpawnedByNpcTypeID(317107) then
			  e.self:Message(MT.Yellow, "The magic of the arch magus holds the shield firmly in place");
		  end
	  end
  end
  
  
