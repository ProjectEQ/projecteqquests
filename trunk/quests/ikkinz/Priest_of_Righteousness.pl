sub EVENT_SPAWN {
  quest::setnexthpevent(50);
}

sub EVENT_HP {
  if($hpevent == 50) {
     #ae rampage
     quest::setnexthpevent(10);
     }
  if($hpevent == 10) {
    #ae rampage
     }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if(($x > 500) || ($x < 200) || ($y > -30) || ($y < -250)) {
    $npc->GMMove(-21,-210,-3,60);
  }
}

