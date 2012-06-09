sub EVENT_DEATH {
# When this npc dies, 4x #a_severing_sludge should spawn at its death point.
  quest::spawn2(237788,0,0,$x+5,$y+5,$z,$h); #a_severing_sludge
  quest::spawn2(237788,0,0,$x+5,$y-5,$z,$h); #a_severing_sludge
  quest::spawn2(237788,0,0,$x-5,$y+5,$z,$h); #a_severing_sludge
  quest::spawn2(237788,0,0,$x-5,$y-5,$z,$h); #a_severing_sludge
}