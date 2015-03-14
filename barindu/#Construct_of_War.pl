sub EVENT_SPAWN {
  quest::settimer(1,7500);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::depop();
}