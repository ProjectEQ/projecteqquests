sub EVENT_DEATH_COMPLETE {
  #update zone status
  my $instid = quest::GetInstanceID("tipt",0);
  quest::setglobal($instid.'_tipt_status',3,7,"H6");
  if(!$entity_list->IsMobSpawnedByNpcTypeID(289046)){ #ghost_trigger
    quest::spawn2(289046,0,0,-1370,890,398,388); #ghost_trigger
  }
}
