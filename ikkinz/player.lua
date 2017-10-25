function event_enter_zone(e)
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(227074) == false) then
		eq.spawn2(294631,0,0,0,0,0,0);
	end
end

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	if(door_id == 8 or door_id ==9) then
		if (e.self:HasItem(60240)==true) then
			e.self:Message(15, "The markings on the Overseer's Geostone line up with the markings on the door. It rumbles to life as it opens for you.");			
		end
	elseif (door_id == 13 or door_id ==14) then
		if (e.self:HasItem(60249)==true) then
			e.self:Message(15, "The door reacts to the signet's aura. The ground trembles as the door opens.");
		elseif (e.self:HasItem(60233)==true) then
			e.self:Message(15, "The solid glyphed essence forms to an opening in the door and energy creeps out through the door like a swarm of spiders. The energy recedes in an instant and the door slides open.");
		end
	end
end