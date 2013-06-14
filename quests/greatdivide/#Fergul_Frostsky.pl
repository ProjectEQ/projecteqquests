sub EVENT_SIGNAL {
  quest::SetRunning(1);
  quest::start(58);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 6) {
    quest::signal(118208);
    quest::signal(118040);
  }
}

sub EVENT_DEATH {
  quest::signal(118208);
  quest::signal(118040);
}	
