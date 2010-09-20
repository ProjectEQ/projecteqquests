sub EVENT_SPAWN {
  quest::settimer("depop", 300);
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
}

sub EVENT_DEATH {
  quest::unique_spawn(100222, 0, 0, $x, $y, $z, $h); #Ghost_of_Ridossan
}