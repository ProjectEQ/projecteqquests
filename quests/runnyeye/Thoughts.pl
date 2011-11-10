sub EVENT_SPAWN {
  quest::settimer("pass",24);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("of great treasures and fame spur you on.  Thoughts of certain and painful death do not deter you.");
  }
}
