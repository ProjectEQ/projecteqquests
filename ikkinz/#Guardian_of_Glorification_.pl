sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294585,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
  quest::signalwith(294631,4); # NPC: lockout_ikkinz
}