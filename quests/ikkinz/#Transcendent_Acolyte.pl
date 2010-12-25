sub EVENT_SPAWN {
  quest::setnexthpevent(50);
}

sub EVENT_HP {
  if($hpevent == 50) {
     quest::modifynpcstat("special_attacks",SEQMCNr);
     quest::setnexthpevent(10);
     }
  if($hpevent == 10) {
     quest::modifynpcstat("special_attacks",SEQMCNr);
     }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x < 190) {
    $npc->GMMove(453,-142,6,192);
  }
}
