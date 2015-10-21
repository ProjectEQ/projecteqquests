function event_enter_zone(e)
  local instance_id = eq.get_instance_id("gukg", 50);
  if (instance_id > 0) then
    e.self:MarkSingleCompassLoc(1186, 1352, -12); 
  end
end

function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 5) then
    local instance_id = eq.get_instance_id("gukg", 50);
    if (instance_id > 0) then
      e.self:MovePCInstance(259, instance_id, 149, -289, 51.13, 7)
      return 1;
    end
  end
end
