sub EVENT_SPAWN {
  quest::start(537860);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 6){
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
}
}