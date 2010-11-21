sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 115) {
    $npc->GMMove(-153,-401,3,192);
  }
}
