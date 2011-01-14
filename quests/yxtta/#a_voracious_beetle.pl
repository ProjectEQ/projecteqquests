sub EVENT_SPAWN {
   quest::start(537899);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 9) {
  quest::stop();
  quest::spawn2(291050,0,0,$x,$y,$z,$h);
  quest::depop();
  }
}