function event_click_door(e)
  local door_id = e.door:GetDoorID();
	if(door_id == 61) then	
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(317002)==false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(317003)==false
			and eq.get_entity_list():IsMobSpawnedByNpcTypeID(317004)==false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(317005)==false) then
			e.self:Message(13,"Success Message?");
			e.self:MovePC(317, 504, 4729, 277.6, 0);
			eq.signal(317109 , 1); --signal OMM that a click up happened
		else
			e.self:Message(13,"The seal doesn't react to your presence.");
		end
		
	end
end
--#goto 505 4717 278