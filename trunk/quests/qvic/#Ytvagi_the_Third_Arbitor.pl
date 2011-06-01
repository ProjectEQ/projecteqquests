sub EVENT_AGGRO {
  quest::settimer(1,20);
  }
  
sub EVENT_TIMER {
  quest::signalwith(295149,1);
  }

sub EVENT_DEATH {
  $check_cyno = $entity_list->GetMobByNpcTypeID(295149);
  $check_named = $entity_list->GetMobByNpcTypeID(295145);
  $check_named = $entity_list->GetMobByNpcTypeID(295146);
  $check_named = $entity_list->GetMobByNpcTypeID(295148);
  if($check_cyno == 0) {
      }
  elsif($check_named == 0) {
    quest::spawn2(295147,0,0,$x,$y,$z,$h);
  }
}