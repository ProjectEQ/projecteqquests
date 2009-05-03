#Chief Ry'Gorr for ring 8

sub EVENT_SPAWN {
  quest::settimer(93,1000);
}

sub EVENT_TIMER {
  if ($timer == 93) {
    quest::depop(116577);
  }
}