sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($y < 1) {
    $npc->GMMove(937,14,-72,200);
  }
}