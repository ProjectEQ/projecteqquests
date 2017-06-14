sub EVENT_DEATH_COMPLETE {
# When this npc dies, 4x #a_severing_sludge should spawn at its death point.
  quest::spawn2(237788,0,0,$x,$y,$z,$h); #a_severing_sludge
  quest::spawn2(237788,0,0,$x,$y,$z,$h); #a_severing_sludge
  quest::spawn2(237788,0,0,$x,$y,$z,$h); #a_severing_sludge
  quest::spawn2(237788,0,0,$x,$y,$z,$h); #a_severing_sludge
}
