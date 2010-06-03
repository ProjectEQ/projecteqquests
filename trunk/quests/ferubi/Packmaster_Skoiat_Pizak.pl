sub EVENT_AGGRO {
   quest::settimer(1,60);
}

sub EVENT_TIMER {
  if($timer == 1) {
   quest::spawn2(284098,0,0,-170,-884,3,57);
   quest::spawn2(284098,0,0,-167,-792,3,68);
   quest::stopteimer(1);
   quest::settimer(1,60);
}
}
sub EVENT_DEATH {
  quest::stoptimer(1);
}

sub EVENT_COMBAT {
  if($combat_state ==0) {
  quest::stoptimer(1);
  quest::depop(284098);
  }
  }
