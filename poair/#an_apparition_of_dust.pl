sub EVENT_SPAWN {
  quest::settimer("dust",30);
}

sub EVENT_TIMER {
  quest::signalwith(215461,6,1);
  quest::stoptimer("dust");
}
