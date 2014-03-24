sub EVENT_DEATH_COMPLETE {
  quest::signalwith(294343,1,0);
  quest::signalwith(294631,2); #set lockout
}