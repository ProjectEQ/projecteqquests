sub EVENT_SIGNAL {
  if($signal == 1) {
	if(!$entity_list->GetMobByNpcTypeID(294574) && !$entity_list->GetMobByNpcTypeID(294338)) {
      $entity_list->FindDoor(2)->SetLockPick(0);
      $entity_list->FindDoor(3)->SetLockPick(0);
      $entity_list->FindDoor(4)->SetLockPick(0);
      $entity_list->FindDoor(5)->SetLockPick(0);
	}
  }
  if($signal == 2) {
	if(!$entity_list->GetMobByNpcTypeID(294339) && !$entity_list->GetMobByNpcTypeID(294575)) {
      $entity_list->FindDoor(6)->SetLockPick(0);
      $entity_list->FindDoor(7)->SetLockPick(0);
	}
  }
}
