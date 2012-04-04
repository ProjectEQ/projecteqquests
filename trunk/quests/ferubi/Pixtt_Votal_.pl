sub EVENT_SPAWN {
  if($entity_list->GetMobByNpcTypeID(284103)) {
    $npc->Depop(1);
  }
}

sub EVENT_DEATH {
  if($entity_list->GetMobByNpcTypeID(284080)) {
    quest::spawn2(284103,0,0,$x,$y,$z,$h);
  }  
}