#Sonic Wolf Leader in the North

sub EVENT_DEATH_COMPLETE 
  {
  # leader is down - send signal after timer.
    #quest::ze(15,"The Sonic Wolf leader is dead, putting the Sonic Wolves in the North in a panic!");
  quest::signalwith(166257, 2, 0);
  }

