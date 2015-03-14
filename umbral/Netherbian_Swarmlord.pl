sub EVENT_SPAWN {
  quest::settimer(1,1800);
}

sub EVENT_TIMER {
  quest::depop();
}
