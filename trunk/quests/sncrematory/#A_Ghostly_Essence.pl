sub EVENT_SPAWN {
  quest::start(537524);
}

sub EVENT_WAYPOINT_ARRIVE {
    if($wp == 26) { 
    quest::spawn2(288087,0,0,$x,$y,$z,$h);

      }
    }