--Zun doors, if one, open both, key is Jade Inlaid Key

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();
	if (door_id == 10 and e.self:HasItem(17288)) then
		entity_list:FindDoor(21):ForceOpen(e.self);
	end
	if (door_id == 21 and e.self:HasItem(17288)) then
		entity_list:FindDoor(10):ForceOpen(e.self);
	end
end