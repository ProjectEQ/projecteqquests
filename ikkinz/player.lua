function event_enter_zone(e)
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(227074) == false) then
		eq.spawn2(294631,0,0,0,0,0,0); -- NPC: lockout_ikkinz
	end
end

function event_click_door(e)
local instance_ver = eq.get_zone_instance_version();
	local door_id = e.door:GetDoorID();
	if(door_id == 8 or door_id ==9) then
		if (e.self:HasItem(60240)==true and instance_ver==5) then
			e.self:Message(15, "The markings on the Overseer's Geostone line up with the markings on the door. It rumbles to life as it opens for you.");			
		elseif (e.self:HasItem(60225)==true and instance_ver==4) then
			e.self:Message(15, "The glyphs on Axtekilitek and the door glow momentarily before the doors slide open.");			
		elseif instance_ver == 2 then -- group trial 3
			e.self:Message(15, "The stone nearby shudders as the massive doors part for you.")
		elseif instance_ver == 0 or instance_ver == 1 then -- group trials 1 or 2
			e.self:Message(13, "The door appears to have been sealed shut long ago. You will be unable to open it.")
		end		
	elseif (door_id == 13 or door_id ==14) then
		if (e.self:HasItem(60249)==true and instance_ver==6) then
			e.self:Message(15, "The door reacts to the signet's aura. The ground trembles as the door opens.");
		elseif (e.self:HasItem(60233)==true and instance_ver==5) then
			e.self:Message(15, "The solid glyphed essence forms to an opening in the door and energy creeps out through the door like a swarm of spiders. The energy recedes in an instant and the door slides open.");
		end
	elseif (door_id == 10 or door_id ==12) then
		if (e.self:HasItem(60227)==true and instance_ver==4) then
			e.self:Message(15, "Kruxilitek seemingly melds to the door before falling back into your hand. The door opens with ease.");
		elseif instance_ver == 2 then -- group trial 3
			e.self:Message(13, "This door has been sealed magically from the other side. There is no way to tell what might lie in the halls beyond.")
		end		
	elseif door_id == 2 or door_id == 3 or door_id == 5 then
		e.self:Message(15, "Magic rocks rub against stone and charge the air as the door opens.")
	elseif door_id == 6 or door_id == 7 and (instance_ver == 0 or instance_ver == 1 or instance_ver == 2) then -- group instances
		e.self:Message(13, "This door is damaged and has been closed for some time. There is no telling who caused the damage, but it will be impossible to repair.")
	elseif door_id == 15 or door_id == 16 then
		e.self:Message(15, "The door gives way freely as dust falls from the cracks.")
	end
end