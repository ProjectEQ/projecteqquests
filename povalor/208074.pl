sub EVENT_SPAWN {
  quest::setnexthpevent(80);
}

sub EVENT_HP {
  if($hpevent == 80) {
    quest::signal(208172,0);
    quest::setnexthpevent(60);
  }
  if($hpevent == 60) {
    quest::signal(208169,0);
    quest::setnexthpevent(40);
  }
  if($hpevent == 40) {
    quest::signal(208174,0);
    quest::setnexthpevent(20);
  }
  if($hpevent == 20) {
    quest::signal(208171,0);
    quest::signal(208022,0);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(202368,0,0,$x,$y,$z,$h);
}