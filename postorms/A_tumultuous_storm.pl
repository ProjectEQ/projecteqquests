sub EVENT_SPAWN {
    quest::settimer("despawn",15);
}
sub EVENT_TIMER {
  if($timer eq "despawn") {
    quest::depopall(210247);
  }
}
