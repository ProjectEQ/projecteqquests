sub EVENT_SPAWN {
  quest::settimer("despawn", 600);
}

sub EVENT_TIMER {
  if ($timer eq "despawn") {
    quest::stoptimer("despawn");
    quest::depop();
  }
}
