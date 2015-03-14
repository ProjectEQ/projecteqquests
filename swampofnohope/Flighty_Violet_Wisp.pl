sub EVENT_SPAWN {
  quest::settimer("depop", 600); #depop after 10 minutes
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::stoptimer("depop"); #don't depop while in combat
  }
  else {
    quest::settimer("depop", 600); #reset depop timer
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("depop");
}