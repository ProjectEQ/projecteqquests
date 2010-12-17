sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 720) {
    $npc->GMMove(531,-157,-49,126);
  }
}
