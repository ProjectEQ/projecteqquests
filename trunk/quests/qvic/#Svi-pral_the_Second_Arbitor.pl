sub EVENT_AGGRO {
  quest::settimer(1,20);
  }
  
sub EVENT_TIMER {
  quest::signalwith(295149,1);
  }

sub EVENT_DEATH {
  $check_cyno = $entity_list->GetMobByNpcTypeID(295149);
  $check_named = $entity_list->GetMobByNpcTypeID(295145);
  $check_named = $entity_list->GetMobByNpcTypeID(295147);
  $check_named = $entity_list->GetMobByNpcTypeID(295148);
  if($check_cyno == 0) {
      }
  elsif($check_named == 0) {
    quest::spanw2(295145,0,0,-216,-191,-467,192);
    quest::spanw2(295146,0,0,-316,-181,-464,64);
    quest::spanw2(295147,0,0,-243,-250,-439,248);
    quest::spanw2(295148,0,0,-357,-275,-435,25);
  }
}