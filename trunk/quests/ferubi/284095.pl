sub EVENT_DEATH {
  $check_named = $entity_list->GetMobByNpcTypeID(284092);
	if ($check_named) {
            quest::spawn2(284095,0,0,1402,-418,106,164);
}
}