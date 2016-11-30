function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 2) then  
      e.self:MovePC(336, -129, -1236,-237.6,35);   
  end
end

function event_enter_zone(e)
  e.self:ClearCompassMark(); 
end