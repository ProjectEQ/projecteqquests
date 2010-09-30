sub EVENT_DEATH {
  if ($entity_list->GetMobByNpcTypeID(284092)) {
    quest::spawn2(284094,0,0,$x,$y,$z,$h);
  }
}