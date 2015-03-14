sub EVENT_DEATH_COMPLETE {
  my $instid = quest::GetInstanceID("vxed",0);
  my $newvalue = $qglobals{$instid.'_vxed_status'};
  $newvalue++;
  quest::setglobal($instid.'_vxed_status',$newvalue,7,"H6");
  if($newvalue >= 50) {
    SPAWN_EKIKOA();
  }
}

sub SPAWN_EKIKOA {
  if(!$entity_list->IsMobSpawnedByNpcTypeID(290062)) {
    quest::spawn2(290062,0,0,-1156,396,469,166);
    quest::ze(1,"A series of low chants comes to you from the Northeast, as Stonespiritist Ekikoa emerges from the shadows.");
  }
}