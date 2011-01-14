sub EVENT_SPAWN {
  quest::start(537897);
}
sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 5) {
  quest::stop();
  quest::spawn2(291124,0,0,$x,$y,$z,$h);
  quest::depop();
  }
}