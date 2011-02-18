sub EVENT_SPAWN {
  plugin::SetAnim(dead);
  quest::setnexthpevent(70);
}
sub EVENT_AGGRO {
  quest::settimer(240);
  }
sub EVENT_HP {
  if($hpevent == 70) {
   quest::spawn2(292069,0,0,$x,$y,$z,$h);
   quest::depop(292068);
   }
}
sub EVENT_TIMER {
  quest::spawn2(292070,0,0,$x,$y,$z,$h);
  quest::depop();
  }