sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if(($x > 325) || ($x < 130)) {
    $npc->GMMove(243,-501,3,242);
  }
}
