sub EVENT_AGGRO {
  quest::spawn2(293219,0,0,$x,$y,$z,$h);
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(293212,1,0);
}