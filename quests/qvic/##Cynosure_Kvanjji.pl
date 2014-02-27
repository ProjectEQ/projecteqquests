sub EVENT_AGGRO {
  #timer 1 to check that at least one of the arbitors is up, and to respawn them all if not.
  quest::settimer(1,5);
  #timer 2 is for the healing.
  #for now, this will get the event working properly
  #i want to split this into 4 timers with the initial setting 
  #for each one random form 0 to 60, then on first hit, reset timer to 60
  #that way the healing is staggered in the 60 second window.
  quest::settimer(2,60);
}

sub EVENT_TIMER {
  if ($timer == 1) {
    if(!$entity_list->IsMobSpawnedByNpcTypeID(295145) && !$entity_list->IsMobSpawnedByNpcTypeID(295146) && !$entity_list->IsMobSpawnedByNpcTypeID(295147) && !$entity_list->IsMobSpawnedByNpcTypeID(295148)) {
      quest::spawn2(295145,0,0,-216,-191,-467,192);
      quest::spawn2(295146,0,0,-316,-181,-464,64);
      quest::spawn2(295147,0,0,-243,-250,-439,248);
      quest::spawn2(295148,0,0,-357,-275,-435,25);
    }
  } elsif ($timer == 2) {
    #for each arbitor that is up, heal Cyno for 10%
    if($entity_list->IsMobSpawnedByNpcTypeID(295145)) {
      HEAL_CYNO();
    }
    if($entity_list->IsMobSpawnedByNpcTypeID(295146)) {
      HEAL_CYNO();
    }
    if($entity_list->IsMobSpawnedByNpcTypeID(295147)) {
      HEAL_CYNO();
    }
    if($entity_list->IsMobSpawnedByNpcTypeID(295148)) {
      HEAL_CYNO();
    }
  }
}

sub HEAL_CYNO {
  $npc->SetHP($npc->GetHP() + ($npc->GetMaxHP() / 10));
}