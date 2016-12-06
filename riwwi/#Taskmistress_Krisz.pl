sub EVENT_SPAWN {
  quest::shout("Kekken, Uxnikk! What are you fools doing?");
  quest::setnexthpevent(40);
  $npc->ModSkillDmgTaken(8, -50); # backstab
  $npc->ModSkillDmgTaken(36, -65); # piercing
}

sub EVENT_HP {
  if ($hpevent == 40) {
    quest::modifynpcstat("min_hit", 1050);
    quest::modifynpcstat("max_hit", 2950);
    quest::setnexthpevent(30);
  }
  if ($hpevent == 30) {
    quest::modifynpcstat("min_hit", 1160);
    quest::modifynpcstat("max_hit", 3250);
    quest::setnexthpevent(20);
  }
  if ($hpevent == 20) {
    quest::modifynpcstat("min_hit", 1380);
    quest::modifynpcstat("max_hit", 3850);
    quest::setnexthpevent(10);
  }
  if ($hpevent == 10) {
    quest::modifynpcstat("min_hit", 2100);
    quest::modifynpcstat("max_hit", 6850);
    quest::setnexthpevent(5);
  }
  if ($hpevent == 5) {
    quest::modifynpcstat("min_hit", 3986);
    quest::modifynpcstat("max_hit", 13980);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::setglobal("taskmistress",0,7,"D3");
}
