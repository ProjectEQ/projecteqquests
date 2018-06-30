function event_click_door(e)
  local door_id = e.door:GetDoorID();
	if(door_id == 61) then	
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(317002)==false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(317003)==false
			and eq.get_entity_list():IsMobSpawnedByNpcTypeID(317004)==false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(317005)==false) then
			--e.self:Message(13,"Success Message?");
			local instance_id = eq.get_zone_instance_id();
			--e.self:MovePC(317, 504, 4729, 277.6, 0);
			e.self:MovePCInstance(317,instance_id, 504, 4729, 277.6, 0)
			-- so we need to signal to OMM about the click but we don't want to have any weird race with signal processing and client getting up there
			e.self:SetEntityVariable("clicked_up", "1");
			eq.signal(317109 , 1); --signal OMM that a click up happened
			eq.debug("click up to amv");
		else
			e.self:Message(13,"The seal doesn't react to your presence.");
		end
		
	end
	
	if(door_id == 57 or door_id ==58 or door_id ==59 or door_id ==60) then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(317107)==true) then
			e.self:Message(15, "The magic of the arch magus holds the shield firmly in place");
		end
	end
end
--#goto 505 4717 278
