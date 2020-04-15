function event_death_complete(e)
eq.spawn2(342060,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: unconscious_mystic
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(342053) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(342054) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(342055) == false) then
    eq.signal(342052,1); --signal emoush to wake up
  end
end
