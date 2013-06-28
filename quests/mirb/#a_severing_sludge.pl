# When one of these npc's dies, 4x #a_slipper_sludge spawns at its death point

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(237787,0,0,$x+5,$y+5,$z,$h); #a_slippery_sludge
  quest::spawn2(237787,0,0,$x+5,$y-5,$z,$h); #a_slippery_sludge
  quest::spawn2(237787,0,0,$x-5,$y+5,$z,$h); #a_slippery_sludge
  quest::spawn2(237787,0,0,$x-5,$y-5,$z,$h); #a_slippery_sludge
}