sub EVENT_DEATH_COMPLETE {
  quest::signalwith(294343,1,0); # NPC: Spirit_of_Tunik_Tamuik
  quest::signalwith(294631,2); #set lockout
}