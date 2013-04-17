sub EVENT_SPAWN {
  quest::settimer("mist",30);
}

sub EVENT_TIMER {
  quest::signalwith(215455,5,1);
  quest::stoptimer("mist");
}
