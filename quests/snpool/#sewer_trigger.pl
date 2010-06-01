sub EVENT_SPAWN {
  quest::settimer(1,900);  #set timer to spawn named placeholders
  quest::spawn_condition($zonesn,1,0);
}

sub EVENT_TIMER {
  if($timer == 1) {
  quest::spawn_condition($zonesn,1,1);
  quest::stoptimer();
  quest::depop();
  }
}