sub EVENT_SPAWN {
  quest::settimer("pass",24);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("chanting seems to be coming from all directions.");
  }
}