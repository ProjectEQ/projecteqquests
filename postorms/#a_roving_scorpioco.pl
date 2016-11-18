sub EVENT_SPAWN {
  quest::settimer("despawnScorp",20);
}

sub EVENT_TIMER {
  if($timer eq "despawnScorp") {
    quest::depopall(210249);
  }
} 
