sub EVENT_DEATH_COMPLETE {
  $sirran= undef;
  if(!defined($qglobals{sirran}) && !$entity_list->IsMobSpawnedByNpcTypeID(71009)) {
    quest::setglobal("sirran",5,3,"M20");
    quest::spawn2(71058,0,0,955,-570,466,195);
  }
  if($entity_list->IsMobSpawnedByNpcTypeID(71013) || $entity_list->IsMobSpawnedByNpcTypeID(71009)) {
    quest::updatespawntimer(2630,1000); #update to respawn in 1 sec if vanquisher or guardian are still up
  }
}
