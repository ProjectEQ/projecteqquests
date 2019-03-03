sub EVENT_COMBAT {
  if ($combat_state == 0) {
    quest::settimer("depop", 300); #Despawn if not engaged (just a guess)
  }
  else {
    quest::stoptimer("depop");
  }
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
}
