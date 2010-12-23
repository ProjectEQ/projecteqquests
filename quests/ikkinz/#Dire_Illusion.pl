sub EVENT_AGGRO {
  quest::settimer(1,1);
}
sub EVENT_TIMER {
  if(($x > 500) || ($x < 200) || ($y > -30) || ($y < -250)) {
    $npc->GMMove(442,-141,11,192);
  }
}
