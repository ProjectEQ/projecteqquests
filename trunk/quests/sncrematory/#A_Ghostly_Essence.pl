sub EVENT_SPAWN {
  quest::start(537524);
}

sub EVENT_WAYPOINT_ARRIVE {
    if($wp == 26) { 
    quest::spawn2(288087,0,0,577,-2352,-59,193);
    quest::depop();
    }
    }