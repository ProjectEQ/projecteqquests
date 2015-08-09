function event_enter_zone(e)
  if ( e.self:GetBindZoneID() == 124 ) then    
    e.self:Message(1, "Illegal Bind!")
    e.self:MovePC(69,840,70,0,0)
  end
end
