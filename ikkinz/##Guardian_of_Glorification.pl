sub EVENT_SPAWN {
  quest::setnexthpevent(50);
}

sub EVENT_HP {
  if($hpevent == 50) {
  quest::ze(0,"Guardian of Glorification splits into two smaller stone workers!");
  quest::spawn2(294584,0,0,$x,$y,$z,$h); # NPC: #Guardian_of_Glorification_
  quest::spawn2(294584,0,0,$x -10,$y,$z,$h); # NPC: #Guardian_of_Glorification_
  quest::depop();
  }
}
