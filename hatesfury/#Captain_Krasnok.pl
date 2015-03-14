sub EVENT_DEATH_COMPLETE {
  #quest::depopall(228122); #Fist_of_Krasnok
  quest::signalwith(228114,333,0); #bleeding_spell
  quest::signalwith(228115,333,0); #drowning_spell
  quest::signalwith(228116,333,0); #hate_spell
  quest::signalwith(228117,333,0); #languish_spell
  quest::signalwith(228118,333,0); #spell_target
  quest::signalwith(228122,66,0); #Fist_of_Krasnok
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
  }
}