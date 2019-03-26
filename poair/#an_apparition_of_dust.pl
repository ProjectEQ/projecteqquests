sub EVENT_SPAWN {
  quest::settimer("dust",30);
}

sub EVENT_TIMER {
  quest::signalwith(215461,6,1); # NPC: #Dust_Trigger
  quest::stoptimer("dust");
}
