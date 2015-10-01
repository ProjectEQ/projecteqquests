function event_click_door(e)
  local door_id = e.door:GetDoorID();

  if (door_id == 3) then
    local instance_id = eq.get_instance_id("takc", 0);
    if (instance_id > 0) then
      e.self:MovePCInstance(241, instance_id, 251.00, 33.00, 4.28, 0.0);
    end

  end
end
