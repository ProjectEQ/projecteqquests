sub EVENT_CLICKDOOR {
  if(($doorid == 3) && ($entity_list->IsMobSpawnedByNpcTypeID(228119) || $entity_list->IsMobSpawnedByNpcTypeID(228120))){
    $client->Message(0,"You got the door open.");
    quest::movepc(228,-1066,-48,-284,380);
  }
  if(($doorid == 4) && ($entity_list->IsMobSpawnedByNpcTypeID(228119) || $entity_list->IsMobSpawnedByNpcTypeID(228120))){
    $client->Message(0,"You got the door open.");
    quest::movepc(228,-1360,-290,74,128);
  }
}