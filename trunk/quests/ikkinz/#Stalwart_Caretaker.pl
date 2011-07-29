sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60234 =>1 )) {
   $entity_list->FindDoor(15)->SetLockPick(0);
   $entity_list->FindDoor(16)->SetLockPick(0);
  }
}