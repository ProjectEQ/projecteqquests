#Ry'Gorr Elite for ring 8

sub EVENT_SPAWN {
  quest::settimer(90,1000);
}

sub EVENT_TIMER {
  if ($timer == 90) {
    quest::depopall(116556);
  }
}