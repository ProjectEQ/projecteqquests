sub EVENT_DEATH_COMPLETE {
  if(!$entity_list->IsMobSpawnedByNpcTypeID(111144)){
    quest::spawn2(111144,0,0,-398,400,22,125);
    }
}


