sub EVENT_DEATH_COMPLETE {
  if($entity_list->GetMobByNpcTypeID(215042)) {
    quest::spawn2(215460,0,0,$x,$y,$z,$h);
  }
}