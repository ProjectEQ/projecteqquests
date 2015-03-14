sub EVENT_SPAWN {
  quest::start(537863);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 11){
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
}
}