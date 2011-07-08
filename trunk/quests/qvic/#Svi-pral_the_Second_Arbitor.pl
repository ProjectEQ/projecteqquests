sub EVENT_AGGRO {
  quest::settimer(1,20);
}
  
sub EVENT_TIMER {
  quest::signalwith(295149,1);
}