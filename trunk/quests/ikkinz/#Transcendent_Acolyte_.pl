sub EVENT_SPAWN {
  quest::setnexthpevent(50);
}

sub EVENT_HP {
  if($hpevent == 50) {
     quest::modifynpcstat("special_attacks",r);
     quest::setnexthpevent(10);
     }
  if($hpevent == 10) {
     quest::modifynpcstat("special_attacks",r);
     }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x < 480) {
    $npc->GMMove(677,-486,-50,192);
  }
}
