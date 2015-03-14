sub EVENT_ENTERZONE {
	#spawn lockout_ikkinz.lua without having a separate one for every version of the zone
	 if (!$entity_list->IsMobSpawnedByNpcTypeID(294631)) {
		quest::spawn2(294631,0,0,0,0,0,0);
	}
}