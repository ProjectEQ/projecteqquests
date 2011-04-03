sub EVENT_DEATH {
  $check_named = $entity_list->GetMobByNpcTypeID(295146);
  $check_named = $entity_list->GetMobByNpcTypeID(295147);
  $check_named = $entity_list->GetMobByNpcTypeID(295148);
  if($check_named == 0) {
    quest::spawn2(295145,0,0,$x,$y,$z,$h);
  }
}