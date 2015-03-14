sub EVENT_SPAWN {
  $npc->SetHP(100000);
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(293218,1,0);
}