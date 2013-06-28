sub EVENT_SPAWN {
  quest::setnexthpevent(50);
}

sub EVENT_HP {
  if($hpevent == 50) {
     quest::modifynpcstat("special_attacks",EFQUCDr);
     quest::setnexthpevent(40);
     }
  if($hpevent == 40) {
     quest::modifynpcstat("special_attacks",EFQUCD);
     quest::setnexthpevent(10);
     }

  if($hpevent == 10) {
     quest::modifynpcstat("special_attacks",EFQUCDr);
     }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 120 || $x < 35 || $y > -100 || $y < -310) {
    $npc->GMMove(-21,-210,-3,60);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(294141,1,0);
}