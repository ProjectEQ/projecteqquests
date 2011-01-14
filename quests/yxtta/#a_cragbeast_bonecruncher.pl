sub EVENT_SPAWN {
   quest::start(537896);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 11) {
  quest::stop();
  quest::spawn2(291123,0,0,$x,$y,$z,$h);
  quest::depop();
  }
}