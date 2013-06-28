sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 115 || $x < -180 || $y > -360 || $y < -470) {
    $npc->GMMove(-153,-401,3,192);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(294141,2,0);
}