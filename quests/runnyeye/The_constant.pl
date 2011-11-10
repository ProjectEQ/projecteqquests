sub EVENT_SPAWN {
  quest::settimer("pass",24);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("yowling and gibberish of goblins echos throughout the passageways.");
  }
}
