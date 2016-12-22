-- Robregen VS/VSR script

function event_spawn(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(102112)) then -- if VS is up. VSR will depop.
    eq.depop_with_timer();
  end
end
