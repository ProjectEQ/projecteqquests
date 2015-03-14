sub EVENT_SPAWN {
  quest::settimer(30);
}
sub EVENT_TIMER {
  quest::depop();
}