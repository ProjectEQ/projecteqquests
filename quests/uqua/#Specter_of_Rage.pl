sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,  67705 =>1 )) {
  $entity_list->SignalAllClients(1);
}
}