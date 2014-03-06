sub EVENT_SPAWN {
  quest::settimer(1,30);
}
sub EVENT_TIMER {
  quest::depop();
}