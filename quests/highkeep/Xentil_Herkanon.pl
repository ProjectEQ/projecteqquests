sub EVENT_SPAWN {
  quest::settimer("depop", 1800); #Depop in 30 minutes
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH {
  quest::signal(6186,0);
  quest::signal(6187,0);
  quest::stoptimer("depop");
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::signal(6186,0);
  quest::signal(6187,0);
  quest::depop();
}