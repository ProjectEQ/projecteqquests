sub EVENT_SPAWN {
  quest::settimer("pass",24);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("falls from the low ceiling, banging you on the head!  Why are you here again?");
  }
}
