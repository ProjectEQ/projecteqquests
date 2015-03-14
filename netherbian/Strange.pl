sub EVENT_SPAWN {
  quest::settimer("stra",17);
}

sub EVENT_TIMER {
 if ($timer eq "stra") {
  quest::emote("chittering noises echo faintly through the tunnels.");
  }
}
