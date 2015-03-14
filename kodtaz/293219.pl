sub EVENT_SPAWN {
  quest::settimer("depop", 8800)
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
}