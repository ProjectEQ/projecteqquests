function event_click_door(e)
	local id = e.door:GetDoorID();

	if ( id == 52 ) then
		eq.get_entity_list():GetDoorsByDoorID(10):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(7):ForceOpen(e.self);
		
	elseif ( id == 53 ) then
		eq.get_entity_list():GetDoorsByDoorID(5):ForceOpen(e.self);
	end
end
