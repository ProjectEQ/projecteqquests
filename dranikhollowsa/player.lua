function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 2) then  
      e.self:MovePC(302, -2017.2, 17.26,205.8,63);   
  end
end

function event_enter_zone(e)
  e.self:ClearCompassMark(); 
end