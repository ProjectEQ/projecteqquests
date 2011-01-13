sub EVENT_SPAWN {
  quest::start(537897);
}
sub EVENT_WAYPOINT {
  if($wp == 5) {
  quest::spawn2(291124,0,0,$x,$y,$z,$h);
  quest::depop();
  }
}