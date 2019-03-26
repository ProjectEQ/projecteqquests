sub EVENT_SPAWN {
  #::: Set flymode to 1 will have Aerin Dar avoid snapping Z to the ground below the platform 'door'
  $npc->SetFlyMode(1);
  quest::setnexthpevent(80);
}

sub EVENT_HP {
  if($hpevent == 80) {
    quest::signal(208172,0); # NPC: A_Mindless_Minion
    quest::setnexthpevent(60);
  }
  if($hpevent == 60) {
    quest::signal(208169,0); # NPC: A_Mindless_Minion
    quest::setnexthpevent(40);
  }
  if($hpevent == 40) {
    quest::signal(208174,0); # NPC: A_Mindless_Minion
    quest::setnexthpevent(20);
  }
  if($hpevent == 20) {
    quest::signal(208171,0); # NPC: A_Mindless_Minion
    quest::signal(208022,0); # NPC: Rahlgon
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(202368,0,0,$x,$y,$z,$h); # NPC: A_Planar_Projection
}
