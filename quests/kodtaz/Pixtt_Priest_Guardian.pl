sub EVENT_SPAWN {
  quest::settimer(1,900);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::depop();
}

sub EVENT_COMBAT {
  if($combat_state == 1) {
    quest::stoptimer(1);
  }
  else {
    quest::settimer(1,900);
  }
}