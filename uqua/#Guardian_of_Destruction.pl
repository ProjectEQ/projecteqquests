sub EVENT_SPAWN {
  plugin::SetAnim(dead);
  quest::setnexthpevent(70);
}

sub EVENT_AGGRO {
  quest::settimer(1,180);
  quest::settimer(2,1);
  quest::ze(15,"The Guardian of Destruction strides forward to deal with its enemies.");
}

sub EVENT_HP {
  if($hpevent == 70) {
    quest::spawn2(292069,0,0,-869,-16,65,250); # NPC: #Vrex_Barxt_Qurat
    quest::depop(292068);
  }
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::spawn2(292070,0,0,$x,$y,$z,$h); # NPC: Guardian_of_Destruction
    quest::depop();
  }
  if($timer == 2) {
    if($y < -184) {
      $npc->GMMove(-866,-43,61,260);
    }
  }
}
