#216094 - Real #Corirnav_the_Avatar_of_Water

sub EVENT_SIGNAL {
  if($signal == 7){ #Event kickout emote
    quest::shout("Violaters of this plane be banished from this domain!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(216107,5,0);
}