sub EVENT_DEATH {
  $check_named = $entity_list->GetMobByNpcTypeID(284092);
	if ($check_named) {
            quest::spawn2(284093,0,0,1254,-563,106,35);
}
}