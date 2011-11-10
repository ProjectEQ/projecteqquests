sub EVENT_SPAWN {
  quest::settimer("pass",24);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("of foul smelling slime coats the floors here, as well as your feet.");
  }
}
