sub EVENT_SPAWN {
  quest::settimer("pass",24);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("not quite sure what a moldmaster is, but you are sure that you don't want to meet it alone, and in the dark.");
  }
}
