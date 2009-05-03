#Kromrif Soldier for ring 8

sub EVENT_SPAWN {
  quest::settimer(91,1000);
}

sub EVENT_TIMER {
  if ($timer == 91) {
    quest::depopall(116548);
  }
}