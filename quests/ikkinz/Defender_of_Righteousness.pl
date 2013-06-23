sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 475 || $x < 190 || $y > -280 || $y < -380) {
    $npc->GMMove(446,-348,3,192);
  }
}

sub EVENT_DEATH {
  quest::signalwith(294141,2,0);
}