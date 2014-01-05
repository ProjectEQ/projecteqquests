sub EVENT_AGGRO {
  quest::settimer(1,60);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::settimer(1,3);
  $check_1 = $entity_list->GetMobByNpcTypeID(293120);
  $check_2 = $entity_list->GetMobByNpcTypeID(293213);
  if (!$check_1 && !$check_2) {
    quest::spawn2(293212,0,0,$x,$y,$z,$h);
    quest::signalwith(293218,0,0);
    quest::stoptimer(1);
    quest::depop_withtimer();
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(293211,0,0,$x,$y,$z,$h);
}