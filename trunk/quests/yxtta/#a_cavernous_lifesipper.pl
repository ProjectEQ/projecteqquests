sub EVENT_SPAWN {
   quest::start(537898);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 10) {
  quest::stop();
  quest::spawn2(291125,0,0,$x,$y,$z,$h);
  quest::depop();
  }
}