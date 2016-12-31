-- Robregen VS/VSR script

function event_spawn(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(102099)) then -- Depop VSR if VSR is up.
    eq.depop_with_timer(102099);
  end
end
