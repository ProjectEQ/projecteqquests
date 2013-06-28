#Guardian_of_Coirnav
#Signals coirnav_controller with the Event start

sub EVENT_SPAWN {
  if(defined $qglobals{coirnav_done} && $qglobals{coirnav_done} == 3) {
    quest::settimer(1,3);
  }
}

sub EVENT_AGGRO {
  quest::say("We are the protectors and guardians of this domain, death is all you will find here.");
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Even now Coirnav awaits to deal swift death to you. Flee, weaklings.");
  quest::signalwith(216107,1,0);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::depop_withtimer();
}