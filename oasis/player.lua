function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 20) then
    local instance_id = eq.get_instance_id("hateplaneb", 1);
    if (instance_id > 0) then
	  e.self:ClearCompassMark();
      e.self:MovePCInstance(186, instance_id, -389.93, -853.94, 2.19, 129);
    end
  end
end

function event_zone(e)
  e.self:ClearCompassMark();
end