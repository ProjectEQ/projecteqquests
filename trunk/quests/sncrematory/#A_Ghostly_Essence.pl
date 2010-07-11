sub EVENT_SPAWN {
  quest::start(537524);
}

sub EVENT_WAYPOINT_ARRIVE {
    if($wp == 26) { 
    quest::signalwith(288088,2,1);
    quest::depop();
    }
    }