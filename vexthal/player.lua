function event_enter_zone(e)
  if ( e.self:GetBindZoneID() == 158 ) then    
    e.self:Message(MT.Default, "Illegal Bind!")
    e.self:MovePC(69,840,70,0,0)
  end
end
