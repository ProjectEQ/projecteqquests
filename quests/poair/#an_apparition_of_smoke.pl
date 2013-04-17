sub EVENT_SPAWN {
  quest::settimer("smoke",30);
}

sub EVENT_TIMER {
  quest::signalwith(215453,5,1);
  quest::stoptimer("smoke");
}
