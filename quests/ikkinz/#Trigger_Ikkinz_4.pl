sub EVENT_SPAWN {
  quest::set_proximity($x-50,$x+50,$y-70,$y+70);
}

sub EVENT_SIGNAL {
  if($signal == 1) {
      $counter += 1;
}
  if($counter == 2) {
    quest::signalwith(294611,1,0);
    }
}

sub EVENT_PROXIMITY_SAY {
  if ($text=~/return/i) {
    quest::gmmove(500,-615,-50,186);
    }
  }
