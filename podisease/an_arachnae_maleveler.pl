#This script will cause the spiderlings to despawn ten minutes after Aramin is killed, in case they wind up wiping a group out.

sub EVENT_SPAWN {
     quest::settimer("depop",600);
}

sub EVENT_DEATH_COMPLETE {
     quest::stoptimer("depop");
}

sub EVENT_TIMER {
  if ($timer eq "depop") {
     quest::stoptimer("depop");
     quest::depop();
   }
}

#Submitted by Jim Mills
