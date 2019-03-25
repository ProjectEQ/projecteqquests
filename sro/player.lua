function event_enter_zone(e)
  local instance_id = eq.get_instance_id("rujg", 50);
  if (instance_id > 0) then
    e.self:MarkSingleCompassLoc(1346.18, -2099.33, -88.0377);
  end
  local instance_id = eq.get_instance_id("rujd", 50);
  if (instance_id > 0) then
    e.self:MarkSingleCompassLoc(1346.18, -2099.33, -88.0377);
  end  
end

function event_click_door(e)
  local door_id = e.door:GetDoorID();

  if (door_id == 1) then
    local instance_id = eq.get_instance_id("rujg", 50);
    if (instance_id > 0) then
      e.self:MovePCInstance(260, instance_id, 238, -1163, 130, 0); -- Zone: oceangreenhills
    end
    local instance_id = eq.get_instance_id("rujd", 50);
    if (instance_id > 0) then
      e.self:MovePCInstance(245, instance_id, -322, 1254, -9525, 240); -- Zone: nektropos
    end
  end
end
