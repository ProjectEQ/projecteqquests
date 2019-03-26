sub EVENT_DEATH_COMPLETE {
  quest::signalwith(215461,3,1); # NPC: #Dust_Trigger
  quest::depopall(215460);
}
