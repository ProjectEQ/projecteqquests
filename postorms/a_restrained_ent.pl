sub EVENT_SPAWN {
  quest::settimer("despawnTrees",20);
}
  
sub EVENT_TIMER {
  if($timer == "despawnTrees") {
    quest::depopall(210248);
  }
}
