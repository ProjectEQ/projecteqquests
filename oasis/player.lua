function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 20) then
    e.self:MovePCDynamicZone("hateplaneb")
  end
end
