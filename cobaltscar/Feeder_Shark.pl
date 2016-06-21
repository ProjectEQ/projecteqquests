sub EVENT_SPAWN {
  quest::settimer("depop",1800); #Despawn after 30 minutes
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
}

sub EVENT_AGGRO {
  quest::emote("swims at a ferocious speed toward its prey");
}
sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("depop");
}