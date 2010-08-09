sub EVENT_SPAWN {
  quest::start(537862);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 8){
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
}
}