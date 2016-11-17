sub EVENT_SPAWN {
	quest::settimer(1,3200);
	quest::setnexthpevent(51);
	quest::emote("stands and shakes off the effects of the spell that knocked him unconscious. Seeing Vtiink's corpse he smiles and begins to reach into his pocket when suddenly his face becomes filled with anger letting out a maniacal laugh. 'You have destroyed him, my master Vtiink he who helped show me the way of the Mata Muram, the true joy of pain. Now I shall share that gift with you prepare to suffer the wrath of Smith Rondo.'");
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_DEATH_COMPLETE {
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
