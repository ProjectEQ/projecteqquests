sub EVENT_SPAWN {
  quest::shout("I shall have my revenge!!");
  quest::SetRunning(1);
}

sub EVENT_WAYPOINT_ARRIVE {
  if ($wp == 6) {
    quest::unique_spawn(100133, 0, 0, -629, 1219, 1028, 39.5); #Disciple_Okarote
  }
}