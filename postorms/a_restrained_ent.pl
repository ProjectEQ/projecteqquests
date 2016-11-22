sub EVENT_SPAWN {
  quest::settimer("despawnTrees",20);
}
  
sub EVENT_TIMER {
  if($timer eq "despawnTrees") {
    quest::depopall(210248);
  }
}
