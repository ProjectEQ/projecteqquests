sub EVENT_WAYPOINT_ARRIVE {
  if ($wp == 8) {
    quest::SetRunning(1);
  }
  if ($wp == 16) {
    quest::SetRunning(0);
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Halt!! This tunnel is used primarily for the forces of the Union of Vie. Citizens and adventurers are to use the main entrance.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:firiona  ID:84124 -- Scout_Bowfist