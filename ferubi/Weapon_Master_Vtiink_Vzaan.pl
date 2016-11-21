sub EVENT_SPAWN {
  quest::spawn2(284093,0,0,1328.82,-608.43,106.23,2.6);
  quest::spawn2(284094,0,0,1327.06,-375.38,106.13,128);
  quest::spawn2(284095,0,0,1440.70,-421.54,106.13,193.2);
  quest::spawn2(284096,0,0,1439.92,-562.61,106.13,193.2);
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(284074,1,1);
}

sub EVENT_COMBAT {
  if($combat_state == 0) {
    quest::depopall(284093);
    quest::depopall(284094);
    quest::depopall(284095);
    quest::depopall(284096);
    quest::depop();
  }
}


 
