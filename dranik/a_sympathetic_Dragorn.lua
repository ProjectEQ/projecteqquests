function event_death_complete(e)
if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(336059) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(336060) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(336061) then
 	eq.signal(336061,1); -- NPC: Tiorpat_Tornwing
 	--eq.signal(336058,1); -- NPC: a_Dragorn_realist
 	--eq.signal(336057,1); -- NPC: a_Dragorn_heckler
  end
end
