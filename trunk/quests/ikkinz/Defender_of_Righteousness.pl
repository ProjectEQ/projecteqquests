sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x < 190) {
    $npc->GMMove(446,-348,3,192);
  }
}
