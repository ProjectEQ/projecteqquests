sub EVENT_DEATH {
  if($entity_list->GetMobByNpcTypeID(284080)) {
    quest::spawn2(284079,0,0,$x,$y,$z,$h);
  }  
}