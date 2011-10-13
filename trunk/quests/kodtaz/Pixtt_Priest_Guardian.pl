sub EVENT_SPAWN {
  quest::settimer(1,900);
}

sub EVENT_TIMER {
  quest::depop();
}

sub EVENT_COMBAT {
  if($combat_state == 1) {
    quest::stoptimer(1);
  }
  elsif($combat_state == 0) {
    quest::settimer(1,900);
  }
}