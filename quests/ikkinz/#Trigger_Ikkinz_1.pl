sub EVENT_SIGNAL {
  if($signal == 1) {
    if(!$entity_list->IsMobSpawnedByNpcTypeID(294574) && !$entity_list->IsMobSpawnedByNpcTypeID(294338)) { #Priest of Righteousness
      $entity_list->FindDoor(2)->SetLockPick(0);
      $entity_list->FindDoor(3)->SetLockPick(0);
      $entity_list->FindDoor(4)->SetLockPick(0);
      $entity_list->FindDoor(5)->SetLockPick(0);
    }
  }
  if($signal == 2) {
    if(!$entity_list->IsMobSpawnedByNpcTypeID(294339) && !$entity_list->IsMobSpawnedByNpcTypeID(294575)) { #Defender of Righteousness
      $entity_list->FindDoor(6)->SetLockPick(0);
      $entity_list->FindDoor(7)->SetLockPick(0);
    }
  }
}
