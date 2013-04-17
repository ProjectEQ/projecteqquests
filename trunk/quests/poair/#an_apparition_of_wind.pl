sub EVENT_SPAWN {
  quest::settimer("wind",30);
}

sub EVENT_TIMER {
  quest::signalwith(215450,6,1);
  quest::stoptimer("wind");
}
