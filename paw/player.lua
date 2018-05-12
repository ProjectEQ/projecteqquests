function event_click_door(e)
    local door_id = e.door:GetDoorID();
    local entity_list = eq.get_entity_list();

    if (door_id == 52) then
        entity_list:FindDoor(10):ForceOpen(e.self);
        entity_list:FindDoor(7):ForceOpen(e.self);
    elseif (door_id == 53) then
        entity_list:FindDoor(5):ForceOpen(e.self);
    end
end

