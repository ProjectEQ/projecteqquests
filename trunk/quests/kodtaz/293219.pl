sub EVENT_SPAWN {
  quest::settimer(8800)
}

sub EVENT_TIMER {
  quest::depop();
}