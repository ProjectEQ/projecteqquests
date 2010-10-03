sub EVENT_SPAWN {
  $npc->SetHP(100000);
}
sub EVENT_DEATH {
  quest::signalwith(293218,1);
}
