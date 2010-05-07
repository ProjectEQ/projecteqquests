sub EVENT_DEATH {
  $check_named = $entity_list->GetMobByNpcTypeID(284092);
	if ($check_named) {
            quest::spawn2(284096,0,0,1400,-565,106,227);
}
}