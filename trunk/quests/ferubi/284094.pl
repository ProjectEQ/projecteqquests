sub EVENT_DEATH {
  $check_named = $entity_list->GetMobByNpcTypeID(284092);
	if ($check_named) {
            quest::spawn2(284094,0,0,1256,-419,106,102);
}
}