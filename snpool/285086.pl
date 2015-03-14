sub EVENT_SPAWN {
  quest::start(537858);
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 2){
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
}
}
