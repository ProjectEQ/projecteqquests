sub EVENT_SPAWN {
  quest::setnexthpevent(50);
}

sub EVENT_HP {
  if($hpevent == 50) {
  quest::spawn2(294584,0,0,$x,$y,$z,$h);
  quest::spawn2(294584,0,0,$x -10,$y,$z,$h);
  quest::depop();
  }
}
