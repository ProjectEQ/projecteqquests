sub EVENT_DEATH {
  if($entity_list->GetMobByNpcTypeID(215042)) {
    quest::spawn2(215460,0,0,$x,$y,$z,$h);
  }
}