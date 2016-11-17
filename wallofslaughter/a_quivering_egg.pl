sub EVENT_SPAWN {
  quest::settimer("despawn",600);
  quest::settimer("murkadds",30);
}

sub EVENT_TIMER {
  if($timer == "murkadds") {
    quest::spawn2(300084,0,0,$x,$y,$z,$h);
  } elsif ($timer == "despawn") {
    quest::depop();
  }
}
