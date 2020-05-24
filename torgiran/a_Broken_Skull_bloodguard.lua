function event_death_complete(e)
  if(eq.get_entity_list():GetNPCBySpawnID(47793) == true or eq.get_entity_list():GetNPCBySpawnID(47819) == true or eq.get_entity_list():GetNPCBySpawnID(47820) == true or eq.get_entity_list():GetNPCBySpawnID(57759) == true) then
eq.signal(226211,1); --signal The_room to add to wave counter
  end
end
