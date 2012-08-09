sub EVENT_SPAWN {
  quest::settimer(1,1200);
}

sub EVENT_TIMER {
  quest::depop();
}
