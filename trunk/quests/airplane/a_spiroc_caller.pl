sub EVENT_DEATH_COMPLETE {
	if($entity_list->IsMobSpawnedByNpcTypeID(71009)) {
		quest::updatespawntimer(2632,1000); #update to respawn in 1 sec if vanquisher are still up
	}
}
