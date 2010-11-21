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

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if(($x < 850) || ($y < -583) || ($y > -334)) {
    $npc->GMMove(1039,-460,-65,192);
  }
}
