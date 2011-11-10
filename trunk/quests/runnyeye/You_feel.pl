sub EVENT_SPAWN {
  quest::settimer("pass",24);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("brave enough to challenge the Goblin Lord in his lair.  Brave, or foolish?");
  }
}
