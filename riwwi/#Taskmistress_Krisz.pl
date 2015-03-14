sub EVENT_SPAWN {
  quest::shout("Kekken, Uxnikk! What are you fools doing?");
  $npc->ModSkillDmgTaken(8, -50); # backstab
  $npc->ModSkillDmgTaken(36, -65); # piercing
}

sub EVENT_DEATH_COMPLETE {
  quest::setglobal("taskmistress",0,7,"D3");
}
