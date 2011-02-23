sub EVENT_SPAWN {
  plugin::SetAnim(dead);
  quest::setnexthpevent(70);
}
sub EVENT_AGGRO {
  quest::settimer(240);
  quest::ze(15,"strides forward to deal with its enemies.");
  }
sub EVENT_HP {
  if($hpevent == 70) {
   quest::spawn2(292069,0,0,-869,-16,65,125);
   quest::depop(292068);
   }
}
sub EVENT_TIMER {
  quest::spawn2(292070,0,0,$x,$y,$z,$h);
  quest::depop();
  }