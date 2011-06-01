sub EVENT_SPAWN {
  quest::setnexthpevent(51);
}

sub EVENT_DEATH {
  quest::spawn2(284084,0,0,1447,-586,106,0);
}

sub EVENT_HP {
  #change form to ukun
  #example from Quarm to give illusion form $npc->SendIllusion(304,2,1,1,0,1,1,0,1,0,0,0,70);
  if($hpevent == 51) {
    $npc->SendIllusion(392,2,0,0,0,0,0,0,0,0,0,0,$npc->GetSize());
	$npc->NPCSpecialAttacks(F, 0, 0);
  }
}