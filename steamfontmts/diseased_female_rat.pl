#Bertoxxulous Initiate quest npc

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(448036,0,0,$x,$y,$z,$h); #a_young_plague_rat
  quest::spawn2(448036,0,0,$x+5,$y+5,$z,$h); #a_young_plague_rat
  quest::spawn2(448036,0,0,$x+5,$y-5,$z,$h); #a_young_plague_rat
  quest::spawn2(448036,0,0,$x-5,$y+5,$z,$h); #a_young_plague_rat
  quest::spawn2(448036,0,0,$x-5,$y-5,$z,$h); #a_young_plague_rat
}