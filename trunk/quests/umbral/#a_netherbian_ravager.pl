sub EVENT_SPAWN {
  quest::settimer(1,285);
}

sub EVENT_TIMER {
  quest::depop();
}
