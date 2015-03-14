my $instid = 0;

#trigger for the an_enraged_maternal_cragbeast event
sub EVENT_SPAWN {
  quest::set_proximity($x-50,$x+50,$y-50,$y+50);
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    SPAWN_MOTHER();
  }
}

sub SPAWN_MOTHER {
  #if there are no more hatchlings and the mother has not been spawned, spawn her.
  if(!$entity_list->IsMobSpawnedByNpcTypeID(289034) && !$entity_list->IsMobSpawnedByNpcTypeID(289036)) {
    quest::spawn2(289036,0,0,-2040,196,250,113); #spawn #an_enraged_maternal_cragbeast
    quest::setglobal($instid.'_tipt_status',2,7,"H6");
    quest::stoptimer(1);
    $npc->Depop(0);
  } else {
    quest::settimer(1,5);
  }
}

sub EVENT_TIMER {
  if($timer == 1) {
    SPAWN_MOTHER();
  }
}

sub EVENT_ENTER {
  if($instid == 0) {
    $instid = quest::GetInstanceID("tipt",0);
  }
  if($qglobals{$instid.'_tipt_status'} == 0) {
    my $close_clount = 0;
    foreach $pc ($entity_list->GetClientList()) {
      if($pc->CalculateDistance($x, $y, $z) <= 50) {
        $close_count++;
      }
    }
    if($close_count >= 3) {
      quest::spawn2(289034,0,0,-2106,188,250,78);
      quest::spawn2(289034,0,0,-2075,246,250,120);
      quest::spawn2(289034,0,0,-2019,247,250,103);
      quest::spawn2(289034,0,0,-1945,257,250,143);
      quest::spawn2(289034,0,0,-1895,196,250,167);
      quest::spawn2(289034,0,0,-1865,140,250,213);
      quest::spawn2(289034,0,0,-1953,94,250,222);
      quest::spawn2(289034,0,0,-2047,125,250,22);
      #set zone status to 1.
      quest::setglobal($instid.'_tipt_status',1,7,"H6");
    }
  }
}