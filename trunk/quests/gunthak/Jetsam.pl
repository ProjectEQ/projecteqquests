#Jetsam.pl
#Part of Stoicism
#Script to depop Jetsam if it hasn't died in an hour

sub EVENT_SPAWN {
  quest::settimer("depop", 3600); #1 hour on this timer
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  if ($timer eq "depop"){
    quest::stoptimer("depop");
    quest::depop();
  }
}#Done