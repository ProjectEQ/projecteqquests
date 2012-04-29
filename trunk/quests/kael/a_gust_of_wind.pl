sub EVENT_SPAWN {
  quest::settimer("pass",30);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("blows through the cavern.");
  }
}