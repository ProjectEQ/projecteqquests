function event_death_complete(e)
  if(eq.get_entity_list():GetNPCBySpawnID(46864) or eq.get_entity_list():GetNPCBySpawnID(282503)) then --spawn groups inside the treasurer room
eq.signal(226211,1); --signal The_room to add to wave counter
  end
end
