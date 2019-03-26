sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::settimer(1,6);
  } elsif ($combat_state == 0) {
    quest::stoptimer(1);
  }
}

sub EVENT_TIMER {
  if($timer == 1) {
    if($z < 200) {
    $npc->GMMove(0,-1591,269.5,0);
    }
  }
}

sub EVENT_DEATH_COMPLETE {
quest::spawn2(218068,0,0,$x,$y,$z,$h); # NPC: A_Planar_Projection
}
