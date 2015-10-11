function event_click_door(e)
  local door_id = e.door:GetDoorID();

  if (door_id == 1) then
    local instance_id = eq.get_instance_id("rujg", 50);
    if (instance_id > 0) then
      e.self:MovePCInstance(260, instance_id, 238, -1163, 130, 0);
    end

  end
end
