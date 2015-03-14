sub EVENT_SPAWN {
  quest::start(537859);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 1){
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
}
}
