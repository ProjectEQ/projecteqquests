function event_death(e)
  if(eq.get_entity_list():GetNPCBySpawnID(46864) == true or eq.get_entity_list():GetNPCBySpawnID(282503) == true) then --spawn groups inside the treasurer room
    eq.signal(226211,1); --signal The_room to add to wave counter
  end
end
