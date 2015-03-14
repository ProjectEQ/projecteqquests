sub EVENT_SPAWN {
  quest::settimer(1,600);
}

sub EVENT_TIMER {
  quest::depop();
}