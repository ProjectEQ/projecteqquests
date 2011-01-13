sub EVENT_SPAWN {
   quest::start(537898);
}

sub EVENT_WAYPOINT {
  if($wp == 10) {
  quest::spawn2(291125,0,0,$x,$y,$z,$h);
  quest::depop();
  }
}